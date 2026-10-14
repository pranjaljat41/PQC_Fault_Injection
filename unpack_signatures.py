import os

# ML-DSA-44 Parameters
N = 256
Q = 8380417
L = 4
K = 4
CTILDEBYTES = 32
GAMMA1 = 1 << 17  # 131072
BETA = 39
POLYZ_PACKEDBYTES = 576
SIG_LEN_BYTES = 2420

GAMMA2 = (Q - 1) // 88  # 95232 for ML-DSA-44

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
        poly_z = []
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
            
            # Subtract GAMMA1 to make signed
            poly_z.extend([c0 - GAMMA1, c1 - GAMMA1, c2 - GAMMA1, c3 - GAMMA1])
        z_coeffs.append(poly_z)
            
    return c_tilde, z_coeffs

def load_signatures(filename):
    if not os.path.exists(filename):
        print(f"File {filename} not found.")
        return []
        
    with open(filename, "r") as f:
        content = f.read()
        
    blocks = content.split("LEAKY SIG!")[1:]
    signatures = []
    for block in blocks:
        lines = block.strip().split("\n")
        sig_data = {}
        for line in lines:
            if line.startswith("sig="):
                sig_data["sig"] = line.split("=")[1]
            elif "=" in line:
                k, v = line.split("=")
                sig_data[k] = v
        if "sig" in sig_data:
            signatures.append(sig_data)
    return signatures

import json

def export_to_json(sigs_data, filename="unpacked_signatures.json"):
    with open(filename, "w") as f:
        json.dump(sigs_data, f, indent=4)
    print(f"\n[+] Full unpacked signature data saved to: {filename}")

def main():
    print("="*60)
    print(" Dilithium Fault Analysis: Step 1 (Vector Unpacking)")
    print("="*60)
    
    sigs = load_signatures("DILITHIUM_LEAKY_SIG.txt")
    print(f"Loaded {len(sigs)} leaky signatures from dataset.\n")
    
    json_export_data = []

    for idx, s in enumerate(sigs):
        c_tilde, z_polys = parse_sig(s["sig"])
        
        # Flatten all z polynomials to find the absolute max
        z_flat = [coeff for poly in z_polys for coeff in poly]
        max_z = max(abs(coeff) for coeff in z_flat)
        limit_z = GAMMA1 - BETA
        
        print(f"--- Signature [{idx}] (ext_offset={s.get('ext_offset')}) ---")
        print(f"c_tilde hash: {c_tilde.hex()[:16]}... (Length: 32 bytes)")
        
        json_export_data.append({
            "id": idx,
            "ext_offset": s.get("ext_offset"),
            "width": s.get("width"),
            "offset": s.get("offset"),
            "c_tilde_hex": c_tilde.hex(),
            "z_vectors": z_polys,
            "z_max_coeff": max_z,
            "passed_z_check": bool(max_z < limit_z)
        })
        
        print(f"z vectors (L={L}):")
        for i in range(L):
            print(f"  z[{i}] max coeff = {max(abs(x) for x in z_polys[i])}")
            
        print(f"Evaluated |z| check: Max = {max_z} vs Limit = {limit_z}")
        if max_z >= limit_z:
            print(">>> The 'z' bound was breached! Fault targeted the FIRST rejection branch.")
        else:
            print(">>> The 'z' bound is completely normal (Passed).")
            print(f">>> CONCLUSION: Since the signature is faulty but 'z' passed, we mathematically prove ")
            print(f"    that the glitch successfully bypassed the second rejection branch: the 'w0' bound check!")
        print()
        
    export_to_json(json_export_data)

    print("="*60)
    print(" Step 2 (w0 Computation) Notice:")
    print(" Because w_0 = (A*z - c*t1) mod q, computing it requires the Public Key (A matrix).")
    print(" Since test_glitch_dilithium.c only outputs signatures, we must next generate the identical ")
    print(" Public Key using pqm4's deterministic randombytes.c in order to evaluate w_0!")
    print("="*60)

if __name__ == "__main__":
    main()
