# ML-DSA-44 Parameters
N = 256
Q = 8380417
L = 4
K = 4
CTILDEBYTES = 32
GAMMA1 = 1 << 17  # 131072
BETA = 39

# Known Golden c_tilde from the deterministic run (rnd[i]=i seed)
# Target (GOLD) from attack_dilithium.py output:
GOLD_SIG_PREFIX = "d02fa1eb38e6c866777079702d994c8376e54855"  # first 40 hex chars

POLYZ_PACKEDBYTES = 576
SIG_LEN_BYTES = 2420

GAMMA2 = (Q - 1) // 88  # = 95232 for ML-DSA-44

def check_norm(z):
    """
    Check if max coefficient of z is >= GAMMA1 - BETA
    This is what poly_chknorm checks in Dilithium.
    If true, the signature SHOULD HAVE BEEN REJECTED.
    """
    max_val = max(abs(coeff) for coeff in z)
    return max_val >= (GAMMA1 - BETA)

def has_trailing_zeros(sig_hex, min_zeros=10):
    """Check if signature has trailing zeros (incomplete hint packing)."""
    # The hint section is the last 84 bytes (OMEGA+K = 80+4)
    # The last K=4 bytes are cumulative hint counts (may be non-zero)
    # Check for zeros in the OMEGA=80 bytes before those K bytes
    hint_section = sig_hex[2*(CTILDEBYTES + L*POLYZ_PACKEDBYTES):]
    # Strip last 2*K hex chars (hint counters) 
    hint_positions = hint_section[:-(2*K)] if K > 0 else hint_section
    zero_count = 0
    for i in range(len(hint_positions)-2, -1, -2):
        if hint_positions[i:i+2] == '00':
            zero_count += 1
        else:
            break
    return zero_count >= min_zeros


def parse_sig(sig_hex):
    """
    Parse ML-DSA-44 signature into c~ and z polynomials
    """
    sig_bytes = bytes.fromhex(sig_hex)
    assert len(sig_bytes) == SIG_LEN_BYTES, f"Expected {SIG_LEN_BYTES} bytes, got {len(sig_bytes)}"
    
    # 1. Extract c~ (32 bytes)
    c_tilde = sig_bytes[:CTILDEBYTES]
    
    # 2. Extract z (L * 576 bytes)
    z_bytes = sig_bytes[CTILDEBYTES : CTILDEBYTES + L * POLYZ_PACKEDBYTES]
    
    z_coeffs = []
    
    for i in range(L):
        poly_bytes = z_bytes[i*POLYZ_PACKEDBYTES : (i+1)*POLYZ_PACKEDBYTES]
        
        for j in range(N // 4):
            t = poly_bytes[9*j : 9*(j+1)]
            
            c0 = t[0] | (t[1] << 8) | ((t[2] << 16) & 0x3FFFF)
            c1 = (t[2] >> 2) | (t[3] << 6) | ((t[4] << 14) & 0x3FFFF)
            c2 = (t[4] >> 4) | (t[5] << 4) | (t[6] << 12) | ((t[7] << 20) & 0x3FFFF)
            c3 = (t[6] >> 6) | (t[7] << 2) | ((t[8] << 10) & 0x3FFFF)
            
            c0 = (c0 & 0x3FFFF)
            c1 = (c1 & 0x3FFFF)
            c2 = (c2 & 0x3FFFF)
            c3 = (c3 & 0x3FFFF)
            
            # Sub GAMMA1 to make signed
            z_coeffs.extend([c0 - GAMMA1, c1 - GAMMA1, c2 - GAMMA1, c3 - GAMMA1])
            
    return c_tilde, z_coeffs

if __name__ == "__main__":
    with open("DILITHIUM_LEAKY_SIG.txt", "r") as f:
        content = f.read()
        
    blocks = content.split("LEAKY SIG!")[1:]
    print(f"Found {len(blocks)} leaky signatures.")
    
    for idx, block in enumerate(blocks):
        lines = block.strip().split("\n")
        sig = None
        params = {}
        for line in lines:
            if line.startswith("sig="):
                sig = line.split("=")[1]
            elif "=" in line:
                k, v = line.split("=")
                params[k] = v
                
        if sig:
            c_tilde, z = parse_sig(sig)
            max_z = max(abs(coeff) for coeff in z)
            limit = GAMMA1 - BETA
            
            c_hex = c_tilde.hex()
            trailing = has_trailing_zeros(sig, min_zeros=10)
            
            print(f"[{idx}] ext_offset={params.get('ext_offset')}, width={params.get('width')}, offset={params.get('offset')}")
            print(f"    Max |z| coeff: {max_z}")
            print(f"    Allowed Limit: {limit} (GAMMA1 - BETA)")
            print(f"    Extracted c~:  {c_hex}")
            print(f"    c~ matches GOLD: {c_hex.startswith(GOLD_SIG_PREFIX)}")
            print(f"    Trailing zeros (partial sig): {trailing}")
            
            if max_z >= limit:
                if trailing:
                    print(f"    >>> PARTIAL BYPASS: z exceeds bound AND hints incomplete!")
                else:
                    print(f"    >>> FULL BYPASS: Rejection sampling DEFEATED! Invalid sig forced out!")
            elif not c_hex.startswith(GOLD_SIG_PREFIX):
                if trailing:
                    print(f"    >>> LIKELY BYPASS: Different c~ (different nonce) + incomplete hints.")
                    print(f"         The glitch skipped a goto rej, but a later check rejected naturally.")
                else:
                    print(f"    >>> POSSIBLE BYPASS: Different c~ with complete hints — needs deeper analysis.")
            else:
                print(f"    >>> NOTE: c~ matches GOLD — glitch corrupted h vector or other metadata.")
            print()
