#!/usr/bin/env python3
"""
Kyber768 Instruction Skip Attack - V6 FOCUSED GOLDEN
Focus ONLY on exact golden parameters with LONG duration
ext_offset=17, width=4, offset=-12
Based on previous success at attempt 4766
"""

import chipwhisperer as cw
import time
import numpy as np
import os
import sys

FW_PATH = "bin/test_glitch.hex"

# EXACT golden parameters from KYBER_SUCCESS.txt
GOLDEN_EXT = 17
GOLDEN_WIDTH = 4
GOLDEN_OFFSET = -12

# Small jitter range around golden
EXT_JITTER = 3  # 14-20
WIDTH_JITTER = 2  # 2-6
OFFSET_JITTER = 4  # -16 to -8

MAX_ATTEMPTS = 50000  # Run for MUCH longer

def setup_scope_and_target():
    print("Connecting to ChipWhisperer...", flush=True)
    try:
        scope = cw.scope()
        target = cw.target(scope)
    except Exception as e:
        print(f"Connection failed: {e}", flush=True)
        return None, None
    
    scope.default_setup()
    scope.clock.clkgen_freq = 7372800
    scope.clock.adc_src = "clkgen_x4"
    scope.io.tio1 = "serial_rx"
    scope.io.tio2 = "serial_tx"
    scope.trigger.triggers = "tio4"
    target.baud = 38400
    
    # Original settings that worked - enable_only
    scope.glitch.clk_src = "clkgen"
    scope.glitch.output = "enable_only"  # Same as original success
    scope.glitch.trigger_src = "ext_single"
    scope.io.glitch_lp = True
    scope.io.glitch_hp = True
    scope.glitch.repeat = 1  # Same as original
    
    return scope, target

def reset_target(scope, target):
    scope.io.nrst = 'low'
    time.sleep(0.05)
    scope.io.nrst = 'high_z'
    time.sleep(0.1)
    target.flush()

def do_glitch(scope, target, target_key, ext_offset, width, offset):
    scope.glitch.ext_offset = ext_offset
    scope.glitch.width = width
    scope.glitch.offset = offset
    
    target.flush()
    
    result = ""
    start = time.time()
    while (time.time() - start) < 0.3:
        if target.in_waiting():
            result += target.read()
            if "WAIT" in result:
                break
        time.sleep(0.005)
    
    if "WAIT" not in result:
        return "timeout", None
    
    scope.arm()
    ret = scope.capture()
    
    if ret:
        return "no_trigger", None
    
    response = ""
    start = time.time()
    while (time.time() - start) < 0.3:
        if target.in_waiting():
            response += target.read()
            if "KEY:" in response and "\n" in response[response.find("KEY:"):]:
                break
        time.sleep(0.005)
    
    if target_key in response:
        return "SUCCESS", scope.get_last_trace()
    elif "KEY:" in response:
        return "normal", None
    else:
        return "crash", None

def main():
    scope, target = setup_scope_and_target()
    if not scope:
        return
    
    print(f"Programming {FW_PATH}...", flush=True)
    try:
        cw.program_target(scope, cw.programmers.STM32FProgrammer, FW_PATH)
        print("Programming successful!", flush=True)
    except Exception as e:
        print(f"Programming failed: {e}", flush=True)
        scope.dis()
        return
    
    reset_target(scope, target)
    time.sleep(0.5)
    
    all_output = ""
    start_time = time.time()
    while time.time() - start_time < 3:
        if target.in_waiting():
            all_output += target.read()
        time.sleep(0.02)
    
    if "GOLD:" not in all_output:
        print("ERROR: No GOLD key!", flush=True)
        scope.dis()
        return
    
    idx = all_output.index("GOLD:") + 5
    remaining = all_output[idx:].strip()
    target_key = remaining.split()[0] if remaining else None
    
    if not target_key or len(target_key) < 32:
        print(f"ERROR: Invalid key", flush=True)
        scope.dis()
        return
    
    print(f"Target Key: {target_key}", flush=True)
    print("="*60, flush=True)
    print("ATTACK V6 - FOCUSED GOLDEN PARAMETERS", flush=True)
    print(f"GOLDEN: ext={GOLDEN_EXT}, width={GOLDEN_WIDTH}, offset={GOLDEN_OFFSET}", flush=True)
    print(f"Jitter: ±{EXT_JITTER} ext, ±{WIDTH_JITTER} width, ±{OFFSET_JITTER} offset", flush=True)
    print(f"Max attempts: {MAX_ATTEMPTS}", flush=True)
    print("="*60, flush=True)
    
    os.makedirs("traces_repro", exist_ok=True)
    
    total = 0
    crashes = 0
    timeouts = 0
    normal = 0
    success_found = False
    
    # Generate parameter ranges
    ext_range = range(GOLDEN_EXT - EXT_JITTER, GOLDEN_EXT + EXT_JITTER + 1)
    width_range = range(max(1, GOLDEN_WIDTH - WIDTH_JITTER), GOLDEN_WIDTH + WIDTH_JITTER + 1)
    offset_range = range(GOLDEN_OFFSET - OFFSET_JITTER, GOLDEN_OFFSET + OFFSET_JITTER + 1)
    
    try:
        cycle = 0
        while total < MAX_ATTEMPTS and not success_found:
            cycle += 1
            for ext_offset in ext_range:
                for width in width_range:
                    for offset in offset_range:
                        total += 1
                        
                        result, trace = do_glitch(scope, target, target_key, ext_offset, width, offset)
                        
                        if result == "SUCCESS":
                            print(f"\n\n{'='*60}", flush=True)
                            print("SUCCESS! INSTRUCTION SKIP CONFIRMED!", flush=True)
                            print(f"ext_offset={ext_offset}, width={width}, offset={offset}", flush=True)
                            print(f"Total: {total}", flush=True)
                            print(f"Cycle: {cycle}", flush=True)
                            print(f"{'='*60}", flush=True)
                            
                            np.save(f"traces_repro/SUCCESS_v6_golden_e{ext_offset}_w{width}_o{offset}.npy", trace)
                            with open("KYBER_SUCCESS_V6.txt", "w") as f:
                                f.write(f"ext_offset={ext_offset}\n")
                                f.write(f"width={width}\n")
                                f.write(f"offset={offset}\n")
                                f.write(f"attempts={total}\n")
                                f.write(f"cycle={cycle}\n")
                                f.write(f"key={target_key}\n")
                            
                            success_found = True
                            break
                        
                        elif result == "crash" or result == "no_trigger":
                            crashes += 1
                            if crashes % 20 == 0:
                                reset_target(scope, target)
                                time.sleep(0.1)
                        elif result == "normal":
                            normal += 1
                        else:
                            timeouts += 1
                            if timeouts % 15 == 0:
                                reset_target(scope, target)
                                time.sleep(0.1)
                        
                        if total >= MAX_ATTEMPTS:
                            break
                    
                    if success_found or total >= MAX_ATTEMPTS:
                        break
                    
                    if total % 500 == 0:
                        crash_pct = crashes / total * 100 if total > 0 else 0
                        print(f"V6 Cycle {cycle}: {total} | Crash:{crashes}({crash_pct:.1f}%) Norm:{normal} TO:{timeouts}", flush=True)
                
                if success_found or total >= MAX_ATTEMPTS:
                    break
        
        if not success_found:
            print(f"\nNo success after {total} attempts across {cycle} cycles.", flush=True)
            print(f"Crashes:{crashes} Normal:{normal} Timeouts:{timeouts}", flush=True)
    
    except KeyboardInterrupt:
        print(f"\nInterrupted at {total}", flush=True)
    
    finally:
        scope.dis()
        target.dis()

if __name__ == "__main__":
    main()
