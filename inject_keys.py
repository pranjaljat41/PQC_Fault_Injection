import re

def hex_to_c_array(hex_str):
    bytes_arr = bytes.fromhex(hex_str)
    c_arr = ""
    for i, b in enumerate(bytes_arr):
        if i % 16 == 0:
            c_arr += "\n    "
        c_arr += f"0x{b:02x}, "
    return c_arr.rstrip(", ")

# Get PK
with open("extract_inequalities.py", "r") as f:
    content = f.read()
    pk_hex = re.search(r'PK_HEX = "([a-f0-9]+)"', content).group(1)

# Get SK
with open("recovered_sk_hex.txt", "r") as f:
    sk_hex = f.read().strip()

# Read target C file
with open("forge_signature.c", "r") as f:
    c_code = f.read()

# Create C arrays
pk_c_arr = hex_to_c_array(pk_hex)
sk_c_arr = hex_to_c_array(sk_hex)

# Replace
c_code = re.sub(
    r'uint8_t pk\[CRYPTO_PUBLICKEYBYTES\];.*?memset\(pk, 0, CRYPTO_PUBLICKEYBYTES\);',
    f'uint8_t pk[CRYPTO_PUBLICKEYBYTES] = {{{pk_c_arr}\n  }};',
    c_code, flags=re.DOTALL
)

c_code = re.sub(
    r'uint8_t recovered_sk\[CRYPTO_SECRETKEYBYTES\];.*?memset\(recovered_sk, 0, CRYPTO_SECRETKEYBYTES\);',
    f'uint8_t recovered_sk[CRYPTO_SECRETKEYBYTES] = {{{sk_c_arr}\n  }};',
    c_code, flags=re.DOTALL
)

with open("forge_signature.c", "w") as f:
    f.write(c_code)

print("Successfully injected PK and SK arrays into forge_signature.c!")
