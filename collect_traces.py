#!/usr/bin/env python3
"""
Trace Collection Script for CPA Analysis
Collects power traces during Kyber768 decapsulation to analyze negs instruction timing.

The trigger in kem.c brackets the cmov() call:
    hal_trigger_toggle();  // HIGH
    cmov(ss, rejection_key, KYBER_SYMBYTES, fail);
    hal_trigger_toggle();  // LOW

This captures exactly the window containing the target `negs` instruction.
"""

import chipwhisperer as cw
import numpy as np
import time
import os
import argparse
from datetime import datetime

FW_PATH = "bin/test_glitch.hex"

def setup():
    """Initialize ChipWhisperer for trace capture (no glitching)."""
    print("="*60)
    print("CPA TRACE COLLECTION")
    print("="*60)
    
    scope = cw.scope()
    target = cw.target(scope)
    
    scope.default_setup()
    scope.clock.clkgen_freq = 24000000
    scope.clock.adc_src = "clkgen_x4"  # 4x oversampling for better resolution
    scope.io.tio1 = "serial_rx"
    scope.io.tio2 = "serial_tx"
    scope.trigger.triggers = "tio4"
    target.baud = 38400
    
    # Increase samples to capture full cmov execution
    # cmov loops KYBER_SYMBYTES=32 times, each iteration ~few cycles
    # Capture more samples for full analysis
    scope.adc.samples = 24000  # Increased for 24MHz (faster execution but higher sample rate)
    
    # Disable glitching - we just want clean traces
    scope.glitch.output = "glitch_only"  # Keep disabled
    scope.io.glitch_lp = False
    scope.io.glitch_hp = False
    
    return scope, target

def reset(scope, target):
    """Reset the target device."""
    scope.io.nrst = 'low'
    time.sleep(0.05)
    scope.io.nrst = 'high_z'
    time.sleep(0.1)
    target.flush()

def capture_trace(scope, target):
    """
    Capture a single power trace during decapsulation.
    
    Returns:
        tuple: (trace, fail_bit) where fail_bit is 1 (invalid ct) or None if error
    """
    target.flush()
    
    # Wait for WAIT signal
    r = ""
    t = time.time()
    while time.time() - t < 0.5:
        if target.in_waiting():
            r += target.read()
            if "WAIT" in r:
                break
        time.sleep(0.005)
    
    if "WAIT" not in r:
        return None, None
    
    # Arm and capture
    scope.arm()
    if scope.capture():
        return None, None
    
    trace = scope.get_last_trace()
    
    # Read result (we always have fail=1 due to modified ciphertext)
    r = ""
    t = time.time()
    while time.time() - t < 0.5:
        if target.in_waiting():
            r += target.read()
            if "KEY:" in r and "\n" in r[r.find("KEY:"):]:
                break
        time.sleep(0.005)
    
    # Since ct is modified in firmware, fail=1 always (unless we skip)
    # We'll record this as the fail bit for CPA
    fail_bit = 1
    
    return trace, fail_bit

def main():
    parser = argparse.ArgumentParser(description='Collect power traces for CPA analysis')
    parser.add_argument('--count', type=int, default=100, help='Number of traces to collect')
    parser.add_argument('--output', type=str, default='traces_cpa', help='Output directory')
    args = parser.parse_args()
    
    os.makedirs(args.output, exist_ok=True)
    
    scope, target = setup()
    
    # print(f"Programming {FW_PATH}...")
    # cw.program_target(scope, cw.programmers.STM32FProgrammer, FW_PATH)
    # print("OK")
    
    reset(scope, target)
    time.sleep(0.5)
    
    # Read boot output to verify setup
    out = ""
    t = time.time()
    while time.time() - t < 3:
        if target.in_waiting():
            out += target.read()
        time.sleep(0.02)
    
    if "GOLD:" in out:
        idx = out.index("GOLD:") + 5
        gold_key = out[idx:].strip().split()[0]
        print(f"GOLD key: {gold_key[:32]}...")
    
    print(f"\nCollecting {args.count} traces...")
    print(f"Output: {args.output}/")
    print("-" * 40)
    
    traces = []
    fail_bits = []
    collected = 0
    errors = 0
    
    try:
        while collected < args.count:
            trace, fail = capture_trace(scope, target)
            
            if trace is not None:
                traces.append(trace)
                fail_bits.append(fail)
                collected += 1
                
                if collected % 10 == 0:
                    print(f"Collected: {collected}/{args.count}")
            else:
                errors += 1
                if errors % 10 == 0:
                    reset(scope, target)
                    time.sleep(0.1)
                    
            if errors > 100:
                print("Too many errors, stopping")
                break
    
    except (KeyboardInterrupt, Exception) as e:
        print(f"\nStopped at {collected} traces. Reason: {e}")
    
    finally:
        scope.dis()
        target.dis()
    
    if collected > 0:
        # Save traces
        traces_array = np.array(traces)
        fail_array = np.array(fail_bits)
        
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        trace_file = f"{args.output}/traces_{timestamp}.npy"
        fail_file = f"{args.output}/fail_bits_{timestamp}.npy"
        
        np.save(trace_file, traces_array)
        np.save(fail_file, fail_array)
        
        print(f"\n{'='*40}")
        print(f"Saved {collected} traces:")
        print(f"  Traces: {trace_file}")
        print(f"  Fail bits: {fail_file}")
        print(f"  Trace shape: {traces_array.shape}")
        print(f"  Sample rate: {scope.clock.adc_freq}Hz")
        print(f"{'='*40}")
        
        # Also save metadata
        with open(f"{args.output}/metadata_{timestamp}.txt", "w") as f:
            f.write(f"count={collected}\n")
            f.write(f"samples={traces_array.shape[1] if len(traces_array.shape) > 1 else len(traces_array[0])}\n")
            f.write(f"adc_freq={scope.clock.adc_freq}\n")
            f.write(f"clkgen_freq={scope.clock.clkgen_freq}\n")
            f.write(f"timestamp={timestamp}\n")

if __name__ == "__main__":
    main()
