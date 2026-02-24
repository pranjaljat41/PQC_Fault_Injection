from mupq import platforms
import time

# The path to your compiled test binary
binary_path = "bin/test_print_keys.hex"

# Initialize the ChipWhisperer platform
platform = platforms.ChipWhisperer()

with platform:
    print(f"Programming target with {binary_path}...")
    # The run method handles flashing and communication
    # We only need to flash here, not run the test.
    # The 'run' method will flash and then reset the device.
    platform.run(binary_path)
    print("Flashing complete.")

print("Done.")
