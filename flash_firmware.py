
import chipwhisperer as cw

# Path to the firmware file you want to flash
# Make sure this path is correct
firmware_path = 'bin/crypto_kem_ml-kem-768_m4fspeed_test.hex'

print(f"Connecting to ChipWhisperer...")
scope = cw.scope()

# Setup scope with default settings
scope.default_setup()

print(f"Programming target with {firmware_path}...")
# For the CW308T with STM32F3 target, we use the STM32FProgrammer
cw.program_target(scope, cw.programmers.STM32FProgrammer, firmware_path)

print("Flashing complete.")

scope.dis()
