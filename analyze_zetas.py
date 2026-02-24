
import struct

q = 3329
zeta = 17
zetas_int32 = [21932846, 3562152210, 752167598, 3417653460, 2112004045, 932791035, 2951903026, 1419184148, 1817845876, 3434425636, 4233039261, 300609006, 975366560, 2781600929, 3889854731, 3935010590, 2197155094, 2130066389, 3598276897, 2308109491, 2382939200, 1228239371, 1884934581, 3466679822, 1211467195, 2977706375, 3144137970, 3080919767, 945692709, 3015121229, 345764865, 826997308, 2043625172, 2964804700, 2628071007, 4154339049, 483812778, 3288636719, 2696449880, 2122325384, 1371447954, 411563403, 3577634219, 976656727, 2708061387, 723783916, 3181552825, 3346694253, 3617629408, 1408862808, 519937465, 1323711759, 1474661346, 2773859924, 3580214553, 1143088323, 2221668274, 1563682897, 2417773720, 1327582262, 2722253228, 3786641338, 1141798155, 2779020594]

def get_powers(base, modulus):
    p = {}
    val = 1
    for i in range(256):
        p[val] = i
        val = (val * base) % modulus
    return p

powers = get_powers(zeta, q)
mont_R = 65536 # 2^16
mont_R_inv = pow(mont_R, -1, q)

print("Checking packed 16-bit values...")

# Bit reversal function for 7 bits (0..127)
def bitrev7(n):
    return int('{:07b}'.format(n)[::-1], 2)

for idx, val in enumerate(zetas_int32):
    # Depending on Endianness and packing
    # Assume Little Endian: low 16 bits are first, high 16 bits are second?
    # Or in array `zetas[0]` -> first element, second element
    
    # Low 16 bits
    low = val & 0xFFFF
    if low >= 32768: low_signed = low - 65536
    else: low_signed = low
    
    # High 16 bits
    high = (val >> 16) & 0xFFFF
    if high >= 32768: high_signed = high - 65536
    else: high_signed = high
    
    msg = f"Idx {idx}: Val={val} (Low={low}/{low_signed}, High={high}/{high_signed})"
    
    # Check low
    mod_low = low_signed % q
    match_low = ""
    # Try Normal
    if mod_low in powers:
        match_low += f"Normal: 17^{powers[mod_low]} "
    # Try Montgomery Form
    recov_low = (mod_low * mont_R_inv) % q
    if recov_low in powers:
        match_low += f"Mont^1: 17^{powers[recov_low]} "
    
    # Check high
    mod_high = high_signed % q
    match_high = ""
    # Try Normal
    if mod_high in powers:
        match_high += f"Normal: 17^{powers[mod_high]} "
    # Try Montgomery Form
    recov_high = (mod_high * mont_R_inv) % q
    if recov_high in powers:
        match_high += f"Mont^1: 17^{powers[recov_high]} "
        
    if match_low or match_high:
        print(f"{msg}")
        if match_low: print(f"  Low Match: {match_low}")
        if match_high: print(f"  High Match: {match_high}")
        
    # Check specific user value
    if idx == 1:
        print(f"\nAnalyzing Index 1 (Value: {val}):")
        print(f"Low: {low} (Mod q: {mod_low})")
        print(f"High: {high} (Mod q: {mod_high})")
        if recov_low in powers:
            print(f"Low represents 17^{powers[recov_low]} in Mont domain")
        if recov_high in powers:
            print(f"High represents 17^{powers[recov_high]} in Mont domain")
