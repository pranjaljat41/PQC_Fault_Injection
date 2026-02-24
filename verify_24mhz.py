#!/usr/bin/env python3
import chipwhisperer as cw
import time
import sys

def verify_24mhz():
    print("Initializing ChipWhisperer...")
    try:
        scope = cw.scope()
    except Exception as e:
        print(f"Error connecting to scope: {e}")
        sys.exit(1)

    print("Targeting 24 MHz operation...")
    scope.default_setup()
    
    # 1. Set Clock
    scope.clock.clkgen_freq = 24000000
    scope.clock.adc_src = "clkgen_x4"
    time.sleep(0.2)
    
    # 2. Verify Lock (Skipped attribute check)
    print(f"Clock config: {scope.clock}")

    target = cw.target(scope)
    # Ensure baud rate is correct (ChipWhisperer calculates this from clkgen_freq if we don't set it fixed?)
    # Actually CW simple_serial uses 38400 by default.
    # We leave it as is.

    print("Flashing firmware (bin/test_glitch.hex)...")
    prog = cw.programmers.STM32FProgrammer
    try:
        cw.program_target(scope, prog, "bin/test_glitch.hex")
    except Exception as e:
        print(f"Flashing failed: {e}")

    print("\n--- Starting Verification ---")
    print("Resetting target and listening for 'INIT'...")
    
    # Reset
    scope.io.nrst = 'low'
    time.sleep(0.05)
    scope.io.nrst = 'high'
    
    # Listen immediately
    start_time = time.time()
    data_buffer = ""
    
    while time.time() - start_time < 2.0:
        n = target.in_waiting()
        if n > 0:
            chunk = target.read(n, timeout=10)
            data_buffer += chunk
            print(f"Received chunk: {repr(chunk)}")
            if "INIT" in data_buffer:
                print("\nSUCCESS! Received 'INIT' from target running at 24 MHz.")
                print(f"Full buffer: {data_buffer[:200]}...")
                scope.dis()
                target.dis()
                return
        time.sleep(0.01)

    print("\nFAILURE. Timed out waiting for 'INIT'.")
    print(f"Received data: {repr(data_buffer)}")
    
    scope.dis()
    target.dis()

if __name__ == "__main__":
    verify_24mhz()
