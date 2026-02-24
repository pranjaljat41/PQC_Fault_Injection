import chipwhisperer as cw
import time

def check_clock():
    print("Connecting to ChipWhisperer...")
    scope = cw.scope()
    
    print(f"Current Clock: {scope.clock.clkgen_freq}")
    
    print("Setting Clock to 24 MHz...")
    scope.clock.clkgen_freq = 24000000
    time.sleep(1)
    
    print(f"New Clock: {scope.clock.clkgen_freq}")
    
    if abs(scope.clock.clkgen_freq - 24000000) > 100000:
        print("FAIL: Clock did not lock to 24 MHz!")
    else:
        print("SUCCESS: Clock is 24 MHz.")
    
    scope.dis()

if __name__ == "__main__":
    check_clock()
