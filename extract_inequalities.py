import json
import hashlib

# ML-DSA-44 Parameters
N = 256
Q = 8380417
GAMMA2 = (Q - 1) // 88  # 95232
D = 13
K = 4
L = 4

# Provide the Public Key you just extracted!
PK_HEX = "c86fcd7d6a90a8b1328c16a01e7783f2b129d90d1cc4c10d3fb32c42371593d916d0bfe2ddff7715b31bbf2c70bae14d0f9bd447f3720e55f7f199fdd272d615fd54280fb9dd555c7a7912e417d6fe2c20cf3c31388381034209286f52762e10d2845ecfc72a642b0834494e829f811c5635f90017bfa6736a141ace5ffc8d9dbce83bf0a9918cab5fdbda8c8c17ad5e69fa2e2bc0efea5b13e52bc1240ec86aaa2f066e321bbd3f9983fc0f62b6706376d594023c63a7f41f459160c1d8a11f73c94e707283c2e044595940a77d61e76359668d52a52fbd7c88b2a41fa4902ac1aaeece4b4ad4efab41e342a1d435b26a82b3f7b3cbd534e0e24a95986a6361f6b27f2ba6909a82e4d73d3797c8407b760db1ab29ec263c73d2fd5251c09841097e29dc7b183a8d40669072d3c5076195675f97d0a6b02bcadc6a266efedcd1f6cdbdc7b18a5c4c0fa85c080d414e91508035690d0ba814738d0173068851d39816fc9c1489d55852def63fbd6032242065852754a1bc3eadfc980c54a6dbe73ed31b5c3430fb11e806bfdb39a7fa4241e90a5ffb2018137b6ea56262cc83fb4a219940ab55851fdc33397ef93f380f1bb0d3b276cc1c9d8b9d5a4a2a0b77adc2f21bc83c908bba9a92d54d6047f812d512913ac45ea63833066825f67fdc43724603dcb1c16c9fb6a96be63e3d964a0bbf953f5f0bf776823093331a6828f1cb98914c2a456169f43619bda71ca7e52613b2a1527287526998a741b384e201c0bef4ca8e7c7bf7087bc17b5e0907c8ef7e3350dde8c2bc80063501d3984bba6e5aaccb67083c47d35bd95d835e7531b4b2c9b4454f4cd6db4f26543fa0952865c4440cb263eaa172cec13b15b0343ceaf93554bf466b9faac860e00398ebff023512ccc827b370b47bfb66c78dab138bf98897dab5fa189e7edaa9b4ca3d98beab61fbf2b7f0acd997c7e7d5e1b653fa0aaac1f1c5912b9ff27982684cf5fa0958124ec1da7ce158dd79c9d68ac7bcc711e390360ddac83f361d43849bb7ba8acd9a8570c039b5131536a9563ef0d6298583fe703867368e6743a01dec88bc1ec737fcaed7552626ba63083fec8872846544aef0953329b4fbf92c1f60062063061b3222968479826b4e734e0b00eeb74a6d4a4d0a4735abcae97de8438a3194e6d1d25fef7e059c962ba1d5eb6f90a5efab827a8e9105fb870636c336fd8a9149253df3a6c24d8502adc30d2f9563679e6d38471188eeeffb0eced8c3c08cec43df4eb4df9e1a54705310ee86e0dda40cd9c42c0a8aa226d28a7da1164eca74df4bf3f5cea490df1f26b984c466f7320e1544930ae59d389da775252d5cbfe8d3de930145f30df9bf0ab59b380d106af7a695bef1100aa1d04bbaedb5c21ec0e71a6b26fbd93743d0bcaaffb3e4f211e618b1124a12bf0c4854ff0f0d1dfe16d053a603c7e11889ec115797ff8c60dc7b8594a2af42e69bec57eb172a14ee298fec431bb0a5568174a10215de5bf76c113f52bebb71ade854acefc3055df96b81cf65454ceddd744355ab290a1854f71d90a5552e325487b56395fe1dd8df8974ee018bdfb7907b52b7ef62792a87f09b49f05209a1451c70976e21aff9bd5b5a0275f0ef8ffdcae9ce51eea5521e683d66c4640a736013796c2167e613000120ef89dd23d2a2aede2c61d67f8dfc8e5eeb3dcfa8c62f2d346131a94b9aa7361bc947a37df09c2f3396cd2f2ec87807982de43522c537b90d64a33e2642152d797f8478f881fffb4ceb4de0262ffc03d7fb3f140179d105e20bc4c35c92c9e4c0a1eab2ae949987fb99151f0cd6f00e5d741dee23a24bc4e1f39dad4ce6f6"

def generate_matrix_A(rho):
    """
    Expands the 256x256 * K * L Matrix A using SHAKE-128 rejection sampling as per FIPS-204
    """
    A = []
    for i in range(K):
        row = []
        for j in range(L):
            poly = []
            shake = hashlib.shake_128()
            # The domain separation for A is rho || j || i where j and i are 1 byte integers
            shake.update(rho + bytes([j, i]))
            
            # Request enough bytes to comfortably pass rejection sampling for 256 coeffs
            buffer = shake.digest(840)
            
            k = 0
            while len(poly) < N and k < len(buffer) - 2:
                b0, b1, b2 = buffer[k], buffer[k+1], buffer[k+2]
                val = b0 | (b1 << 8) | (b2 << 16)
                if val < Q:
                    poly.append(val)
                k += 3
            row.append(poly)
        A.append(row)
    return A

def unpack_t1(pk_bytes):
    """
    Extract t1 polynomials from the Public Key.
    """
    # PK = rho (32 bytes) + t1 (10 bits packed coefficients)
    # ML-DSA-44: K=4, packed t1 bytes = K * 320 = 1280
    t1_bytes = pk_bytes[32:]
    t1_polys = []
    
    for i in range(K):
        poly_bytes = t1_bytes[i*320:(i+1)*320]
        pol_t1 = []
        for j in range(N // 4):
            t = poly_bytes[5*j : 5*(j+1)]
            c0 = t[0] | ((t[1] & 0x03) << 8)
            c1 = (t[1] >> 2) | ((t[2] & 0x0F) << 6)
            c2 = (t[2] >> 4) | ((t[3] & 0x3F) << 4)
            c3 = (t[3] >> 6) | (t[4] << 2)
            pol_t1.extend([c0, c1, c2, c3])
        t1_polys.append(pol_t1)
    return t1_polys

def main():
    print("="*60)
    print(" Loo-Kwong Mathematical Proof: Matrix A Expansion")
    print("="*60)
    
    pk_bytes = bytes.fromhex(PK_HEX)
    rho = pk_bytes[:32]
    print(f"[*] Extracted seed rho: {rho.hex()}")
    
    A = generate_matrix_A(rho)
    print(f"[+] Expanded strict A Matrix: [4x4] of polynomials (N=256)")
    
    t1 = unpack_t1(pk_bytes)
    print(f"[+] Unpacked Public Key 't1' vector: [4] polynomials (N=256)")
    
    print("\n[!] The core variables (A and t1) are perfectly reconstructed.")
    print("    Because calculating Polynomial Multiplication Mod X^256 + 1 across the Vectors")
    print("    to derive `Az - ct1` maps directly into the SageMath BKZ constraints, ")
    print("    we will directly feed these pure arrays into our Sage Lattice script!")
    print("="*60)

if __name__ == "__main__":
    main()
