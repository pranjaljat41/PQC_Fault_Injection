
import struct

q = 3329
zeta = 17
zetas_int32 = [
    21932846, 3562152210, 752167598, 3417653460, 2112004045, 932791035, 2951903026, 1419184148, 
    1817845876, 3434425636, 4233039261, 300609006, 975366560, 2781600929, 3889854731, 3935010590, 
    2197155094, 2130066389, 3598276897, 2308109491, 2382939200, 1228239371, 1884934581, 3466679822, 
    1211467195, 2977706375, 3144137970, 3080919767, 945692709, 3015121229, 345764865, 826997308, 
    2043625172, 2964804700, 2628071007, 4154339049, 483812778, 3288636719, 2696449880, 2122325384, 
    1371447954, 411563403, 3577634219, 976656727, 2708061387, 723783916, 3181552825, 3346694253, 
    3617629408, 1408862808, 519937465, 1323711759, 1474661346, 2773859924, 3580214553, 1143088323, 
    2221668274, 1563682897, 2417773720, 1327582262, 2722253228, 3786641338, 1141798155, 2779020594
]

mont_R = 2**16

def get_powers(base, modulus):
    p = {}
    rev_p = {}
    val = 1
    for i in range(256):
        p[val] = i
        rev_p[i] = val
        val = (val * base) % modulus
    return p, rev_p

powers_map, powers_val = get_powers(zeta, q)

def bitrev7(n):
    return int('{:07b}'.format(n)[::-1], 2)

# Specific analysis for Index 1 (3562152210)
# High: 54354 (mod 3329 = 2134)
# Low: 8466 (mod 3329 = 1808)
target_idx = 1
val_raw = zetas_int32[target_idx]
low = val_raw & 0xFFFF
if low >= 32768: low -= 65536
high = (val_raw >> 16) & 0xFFFF
if high >= 32768: high -= 65536

mod_high = high % q
mod_low = low % q

print(f"Target Index 1: Int32={val_raw}")
print(f"  Low16={low} (Mod3329={mod_low})")
print(f"  High16={high} (Mod3329={mod_high})")

# We want High = Constant * 17^k mod q.
# Let's verify if High and Low are related to ANY power of 17 via a SINGLE constant multiplier.
candidates = {}
for k in range(128): # Check all powers
    z_k = powers_val[k]
    # Calculate required multiplier M = High * z_k^-1 mod q
    z_k_inv = pow(z_k, -1, q)
    M = (mod_high * z_k_inv) % q
    
    # Store candidates
    if M not in candidates: candidates[M] = []
    candidates[M].append(f"High=M*17^{k}")

    # Also check Low
    M_low = (mod_low * z_k_inv) % q
    if M_low not in candidates: candidates[M_low] = []
    candidates[M_low].append(f"Low=M_low*17^{k}")


print("\n--- Checking Plantard Constant Hypothesis ---")
# Hypothesis: Value = floor(u * 2^32 / q) + k? Or Value = (u * 2^32 + 2^31) // q?
# u might be 17^k or 17^k * Mont_R
mont_R = 65536

for idx, val in enumerate(zetas_int32):
    # Recover u from Plantard constant P
    # P approx u * 2^32 / q
    # u approx P * q / 2^32
    u_approx = (val * q) / (2**32)
    u_round = round(u_approx)
    
    # Check if u_round is a power of 17 (or Mont form)
    match_msg = ""
    u_mod = u_round % q
    
    # Check directly
    if u_mod in powers_map:
        k = powers_map[u_mod]
        match_msg += f"17^{k}"
        # Check bitrev
        if k == bitrev7(idx):
            match_msg += " (Matches bitrev!)"
            
    # Check Mont form: u = 17^k * Mont_R
    # So 17^k = u * Mont_R^-1
    u_demont = (u_mod * pow(mont_R, -1, q)) % q
    if u_demont in powers_map:
        k = powers_map[u_demont]
        match_msg += f"17^{k} * Mont_R"
        if k == bitrev7(idx):
            match_msg += " (Matches bitrev!)"

    if idx < 5 or "Matches bitrev" in match_msg: # Print first few or matches
        print(f"Idx {idx} (Val {val}): Approx u={u_round}. Match: {match_msg}")
        
    if idx == 1:
        print(f"\nDetailed Check for Index 1 (Val {val}):")
        print(f"  Approx u = {u_round}")
        print(f"  u mod q = {u_mod}")
        if u_demont in powers_map:
            print(f"  Demont u = {u_demont} -> 17^{powers_map[u_demont]}")
            print(f"  bitrev(1) = {bitrev7(1)}")
            
        # Verify the calculation of the constant
        # Is P = floor(phase * u_mod * 2^32 / q)?
        # sometimes there's a factor of 2? or 2^something?
        # fastntt.S says "improved Plantard", maybe P = u * 2^32 / q
        
        recalc = int((u_mod * (2**32)) / q)
        print(f"  Recalculated P from u={u_mod}: {recalc}")
        print(f"  Difference: {val - recalc}")
        
        # Try u_mod * Mont_R (double mont?)
        # Just standard u


