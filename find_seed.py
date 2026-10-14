#!/usr/bin/env python3
"""
Dilithium Seed Scanner
Communicates with find_seed firmware to identify seeds where nonce=0
fails exactly ONE rejection check (ideal for single-glitch bypass).
"""

import chipwhisperer as cw
import time
import sys

FW_PATH = "bin/find_seed.hex"

def main():
    print("="*60)
    print("DILITHIUM SEED SCANNER")
    print("Find seeds where nonce=0 fails exactly 1 check")
    print("="*60)
    
    scope = cw.scope()
    target = cw.target(scope)
    
    # Manual setup
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
    
    scope.clock.adc_src = "clkgen_x4"
    target.baud = 38400
    
    # Program firmware
    print(f"Programming {FW_PATH}...")
    cw.program_target(scope, cw.programmers.STM32FProgrammer, FW_PATH)
    time.sleep(0.5)
    
    # Read all output — firmware scans seeds 0-255 automatically
    print("Waiting for firmware to scan all seeds...")
    print("This takes ~2-5 minutes on STM32F3 at 24MHz\n")
    
    results = ""
    t = time.time()
    timeout = 600  # 10 minutes max
    
    while time.time() - t < timeout:
        if target.in_waiting():
            results += target.read()
        if "DONE" in results:
            break
        time.sleep(0.1)
    
    if "DONE" not in results:
        print("ERROR: Firmware timed out!")
        print(f"Received so far:\n{results[:500]}")
        scope.dis()
        target.dis()
        return
    
    # Parse results
    print("="*60)
    print("RESULTS")
    print("="*60)
    
    best_seeds = []
    
    results_flat = results.replace('\r', '').replace('\n', '')
    results_flat = results_flat.replace('SEED=', '\nSEED=')
    
    for line in results_flat.split("\n"):
        line = line.strip()
        if not line or line.startswith("INIT") or line == "DONE" or "KEYS OK" in line:
            continue
        
        # Expected format: SEED=X z=P/F w0=P/F ct0=P/F h=P/F nonce=N
        if line.startswith("SEED="):
            parts = line.split()
            try:
                seed_part = parts[0].split("=")[1]
                if not seed_part:  # if empty string
                    continue
                seed_val = int(seed_part)
                
                failures = 0
                fail_names = []
                for part in parts[1:]:
                    if "=" in part and part.endswith("F"):
                        name = part.split("=")[0]
                        failures += 1
                        fail_names.append(name)
                
                nonce_part = [p for p in parts if p.startswith("nonce=")]
                nonce_val = int(nonce_part[0].split("=")[1]) if nonce_part else -1
                
                if failures == 1:
                    best_seeds.append((seed_val, fail_names[0], nonce_val))
                    print(f"  ★ SEED={seed_val}: Only {fail_names[0]} fails at nonce={nonce_val} — IDEAL!")
                elif failures == 0:
                    print(f"    SEED={seed_val}: All pass at nonce={nonce_val} (no rejection needed)")
                else:
                    print(f"    SEED={seed_val}: {failures} failures ({', '.join(fail_names)}) at nonce={nonce_val}")
            except Exception as e:
                print(f"    [Skipped malformed line]: {line}")
                continue
    
    print("\n" + "="*60)
    if best_seeds:
        print(f"FOUND {len(best_seeds)} IDEAL SEEDS:")
        for seed, check, nonce in best_seeds:
            print(f"  SEED={seed}: fails only '{check}' at nonce={nonce}")
        print(f"\nRecommended: Use SEED={best_seeds[0][0]} (fails '{best_seeds[0][1]}')")
    else:
        print("No ideal seeds found in range 0-255.")
        print("Try expanding the scan range.")
    
    print("="*60)
    
    # Save results
    with open("seed_scan_results.txt", "w") as f:
        f.write(results)
    print("Full results saved to seed_scan_results.txt")
    
    scope.dis()
    target.dis()

if __name__ == "__main__":
    main()
