import chipwhisperer as cw
import time

def test_echo():
    print("Connecting...")
    scope = cw.scope()
    target = cw.target(scope)
    
    # Manual setup consistent with our attack
    scope.gain.db = 25
    scope.clock.clkgen_freq = 24000000
    scope.io.tio1 = "serial_rx"
    scope.io.tio2 = "serial_tx"
    scope.io.hs2 = "clkgen"
    target.baud = 38400
    
    print(f"Clock: {scope.clock.clkgen_freq}")
    
    print("Resetting target...")
    scope.io.nrst = 'low'
    time.sleep(0.05)
    scope.io.nrst = 'high_z'
    time.sleep(0.1)
    
    print("Listening for output (5s)...")
    data = ""
    start = time.time()
    while time.time() - start < 5:
        if target.in_waiting():
            c = target.read()
            data += c
            print(c, end="", flush=True)
        time.sleep(0.01)
        
    print("\n\nDone.")
    scope.dis()

if __name__ == "__main__":
    test_echo()
