import chipwhisperer as cw
import time

firmware_path = 'bin/test_glitch_dilithium.hex'

print(f"Connecting to ChipWhisperer...")
scope = cw.scope()
target = cw.target(scope)

scope.default_setup()

# STM32 needs 24MHz clock to perfectly hit 38400 baud configuration
scope.clock.clkgen_freq = 24000000
time.sleep(0.5)
target.baud = 38400

print(f"Programming target with {firmware_path}...")
cw.program_target(scope, cw.programmers.STM32FProgrammer, firmware_path)

print("Flashing complete. Listening to UART for the Public Key...")

# Reset target to get fresh output
scope.io.nrst = 'low'
time.sleep(0.1)
scope.io.nrst = 'high'
time.sleep(0.1)
scope.io.nrst = 'high_z'

output = ""
t = time.time()
while time.time() - t < 15.0:
    if target.in_waiting():
        output += target.read()
    if "GOLD:" in output:
        break
    time.sleep(0.01)

print("\n--- UART OUTPUT ---")
# Only print the head so we don't flood the terminal
print(output[:100] + "...(truncated)...")
print("-------------------\n")

lines = output.split("\n")
pk_hex = None
sk_hex = None

for i, line in enumerate(lines):
    if line.startswith("PK:"):
        if i + 1 < len(lines):
            pk_hex = lines[i+1].strip()
    if line.startswith("SK:"):
        if i + 1 < len(lines):
            sk_hex = lines[i+1].strip()

if sk_hex:
    print("SUCCESS! We captured the Secret Key from the deterministic firmware.\n")
    print("Writing SK to 'recovered_sk_hex.txt' because it's massive...")
    with open("recovered_sk_hex.txt", "w") as f:
        f.write(sk_hex)
    print(f"[SK length verified: {len(sk_hex)} characters / {len(sk_hex)//2} bytes]")
    print("\nWe are ready to paste this into the forgery array!")
else:
    print("ERROR: Did not find SK in output stream.")

scope.dis()
target.dis()
