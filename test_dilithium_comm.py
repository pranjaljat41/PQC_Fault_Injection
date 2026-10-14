import chipwhisperer as cw
import time

print("Setting up ChipWhisperer...")
scope = cw.scope()
target = cw.target(scope)

scope.gain.db = 25
scope.adc.samples = 5000
scope.adc.offset = 0
scope.adc.basic_mode = "rising_edge"
scope.trigger.triggers = "tio4"
scope.io.tio1 = "serial_rx"
scope.io.tio2 = "serial_tx"
scope.io.hs2 = "clkgen"
scope.clock.clkgen_freq = 24000000
scope.clock.adc_src = "clkgen_x4"
target.baud = 38400

print("Programming test_glitch_dilithium.hex...")
cw.program_target(scope, cw.programmers.STM32FProgrammer, "bin/test_glitch_dilithium.hex")
print("Target programmed.")

scope.io.nrst = 'low'
time.sleep(0.1)
scope.io.nrst = 'high'
time.sleep(0.1)
scope.io.nrst = 'high_z'

print("Reset complete. Reading serial buffer (5 seconds)...")
t = time.time()
out = ""
while time.time() - t < 5.0:
    if target.in_waiting():
        out += target.read()
    time.sleep(0.01)

print("--- Output ---")
print(out[:500])
if len(out) > 500:
    print(f"\n... [{len(out)-500} bytes omitted] ...\n")
    print(out[-200:])

scope.dis()
target.dis()
