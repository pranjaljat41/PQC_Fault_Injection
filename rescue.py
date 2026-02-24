import chipwhisperer as cw
import time

try:
    print("Connecting to Scope...")
    scope = cw.scope()
    print("Found Scope.")
    
    print("Resetting Target via NRST...")
    scope.io.nrst = 'low'
    
    # Ensure serial pins are set correctly for programmer
    scope.io.tio1 = "serial_rx"
    scope.io.tio2 = "serial_tx"
    
    time.sleep(0.5)
    scope.io.nrst = 'high'
    time.sleep(0.5)
    
    print("Attempting to enter bootloader mode...")
    # STM32F bootloader entry usually requires:
    # Boot0 = High (handled by CW hardware usually, or PDIC)
    # nRST = Toggle
    
    prog = cw.programmers.STM32FProgrammer
    # We can try to erase it manually if we can connect
    
    print("Checking if programmer can find device...")
    try:
        stm32 = prog()
        stm32.scope = scope
        # Manually set the _scope attribute which seems to be required by some CW versions
        stm32.sp = scope
        stm32.find()
        print("SUCCESS: Target detected!")
        print("Erasing chip to clear bad firmware...")
        stm32.erase()
        print("Chip erased. You can now safe to reprogram.")
    except Exception as e:
        print(f"FAILED to detect chip: {e}")
        print("Trying extended reset sequence...")
        
        # Aggressive toggle
        scope.io.nrst = 'low'
        time.sleep(1.0)
        scope.io.nrst = 'high'
        time.sleep(0.1)
        
        try:
             stm32.find()
             print("SUCCESS: Target recovered on second attempt!")
        except:
             print("STILL FAILED. Physical intervention (unplug/replug) likely required.")

    scope.dis()
except Exception as e:
    print(f"Scope connection error: {e}")
