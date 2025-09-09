from mupq import platforms
import time

# The path to your compiled test binary
binary_path = "bin/test_print_keys.hex"

# Initialize the ChipWhisperer platform
platform = platforms.ChipWhisperer()

with platform:
    print("Programming target...")
    # The run method handles flashing and communication
    output = platform.run(binary_path)
    time.sleep(0.1) # Wait a moment for the output
    print("\nTarget output:")
    print(output)

print("\nDone.")
