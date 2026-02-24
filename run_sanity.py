import chipwhisperer as cw
import time
import sys

def run_sanity():
    print("Connecting to ChipWhisperer...")
    scope = cw.scope()
    target = cw.target(scope)

    print("Setting up scope...")
    scope.default_setup()
    
    # Target settings for STM32F3 on CW Lite
    scope.io.tio1 = "serial_rx"
    scope.io.tio2 = "serial_tx"
    scope.trigger.triggers = "tio4"
    
    # Clock settings
    scope.clock.clkgen_freq = 7372800
    scope.clock.adc_src = "clkgen_x4"
    
    # Explicitly set baud rate
    target.baud = 38400
    
    # Glitch settings (disabled for sanity check initially, just checking trigger)
    scope.glitch.clk_src = "clkgen"
    scope.glitch.output = "clock_xor"
    scope.glitch.trigger_src = "ext_single"
    scope.glitch.repeat = 1
    scope.glitch.output = "enable_only" # Disable glitch output to be safe
    
    # Program firmware
    fw_path = "bin/test_sanity.hex"
    print(f"Programming target with {fw_path}...")
    cw.program_target(scope, cw.programmers.STM32FProgrammer, fw_path)
    
    # Helper to read until a string
    def read_until(term, timeout=2000):
        res = ""
        start = time.time()
        while term not in res:
            if time.time() - start > timeout/1000.0:
                return None
            data = target.read()
            if data:
                print(f"[DEBUG] Received: {repr(data)}")
                res += data
            else:
                time.sleep(0.01)
        return res

    # Reset and Init
    print("Resetting target...")
    scope.io.nrst = 'low'
    time.sleep(0.2)
    scope.io.nrst = 'high'
    time.sleep(0.2)
    
    # Flush any garbage
    target.flush()
    
    print("Waiting for INIT...")
    init_response = read_until("INIT", 3000)
    if not init_response:
        print("Error: Target did not initialize.")
        print("Check: 1. Serial pin configuration (tio1/tio2)")
        print("       2. Baud rate (38400)")
        print("       3. Clock settings")
        return

    print("Target initialized. Testing trigger...")
    
    # Loop to test trigger
    for i in range(10):
        # Sync with target
        # Target sends "WAIT", then triggers
        res = read_until("WAIT")
        if not res:
            print("Target stopped responding.")
            break
            
        scope.arm()
        
        # Target triggers here
        
        if scope.capture():
            print(f"Attempt {i+1}: Timeout - Trigger NOT detected.")
        else:
            print(f"Attempt {i+1}: Success - Trigger detected!")
            
        # Read the counter output
        # Target sends "10\n"
        output = read_until("\n")
        if output:
            print(f"Target output: {output.strip()}")
            
    scope.dis()
    target.dis()

if __name__ == "__main__":
    run_sanity()
