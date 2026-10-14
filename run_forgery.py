import chipwhisperer as cw
import time

firmware_path = 'bin/test_glitch_dilithium.hex'

print(f"Connecting to ChipWhisperer...")
scope = cw.scope()
target = cw.target(scope)

scope.default_setup()
scope.clock.clkgen_freq = 24000000
time.sleep(0.5)
target.baud = 38400

print(f"Programming target with {firmware_path}...")
cw.program_target(scope, cw.programmers.STM32FProgrammer, firmware_path)

print("\nExecuting Hardware Forgery Module...")

scope.io.nrst = 'low'
time.sleep(0.1)
scope.io.nrst = 'high'
time.sleep(0.1)
scope.io.nrst = 'high_z'

output = ""
t = time.time()
# Wait up to 10 seconds for the signature to be generated and verified
while time.time() - t < 10.0:
    if target.in_waiting():
        output += target.read()
    if "[SUCCESS]" in output or "[ERROR]" in output:
        break
    time.sleep(0.01)

print("\n--- FORGERY OUTPUT ---")
print(output)
print("-----------------------\n")

scope.dis()
target.dis()
