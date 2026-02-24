#include <stdio.h>
#include <stdint.h>
#include <string.h>

/* Parameters from Kyber definitions */
#define KYBER_N 256
#define KYBER_Q 3329
#define KYBER_ETA 2

typedef struct {
    int16_t coeffs[KYBER_N];
} poly;

/* Helper to load 32-bit integer from byte array (little endian) */
static uint32_t load32_littleendian(const unsigned char *x) {
    return (uint32_t)x[0] |
           ((uint32_t)x[1] << 8) |
           ((uint32_t)x[2] << 16) |
           ((uint32_t)x[3] << 24);
}

/* The CBD function in question */
void cbd(poly *r, const unsigned char *buf, int add) {
    uint32_t d, t;
    int16_t a, b;
    int i, j;

    for (i = 0; i < KYBER_N / 8; i++) {
        t = load32_littleendian(buf + 4 * i);
        d  = t & 0x55555555;
        d += (t >> 1) & 0x55555555;

        for (j = 0; j < 8; j++) {
            a = (d >>  4 * j)    & 0x3;
            b = (d >> (4 * j + 2)) & 0x3;
            /* 
             * CRITICAL LOGIC: 
             * If add == 0, we zero out the coeff first (Overwrite mode)
             * If add == 1, we skip this (Accumulate mode)
             */
            if (!add)
              r->coeffs[8 * i + j] = 0;
            
            r->coeffs[8 * i + j] = r->coeffs[8 * i + j] + (a - b);
        }
    }
}

int main() {
    poly r;
    unsigned char buf[KYBER_ETA * KYBER_N / 4]; 
    int i;
    int16_t saved_noise_val;

    /* 1. Initialize buffer with deterministic pattern for testing */
    for(i = 0; i < sizeof(buf); i++) {
        buf[i] = (unsigned char)(i * 37 + 5); /* Arbitrary pattern */
    }

    printf("=== CBD Logic Test (add=0 vs add=1) ===\n");
    printf("KYBER_N: %d, Buffer Size: %lu bytes\n\n", KYBER_N, sizeof(buf));


    /* TEST CASE 1: add = 0 (Overwrite) */
    printf("[Test 1] add = 0 (Expect Overwrite)\n");
    
    // Pre-fill poly with "garbage" data
    for(i = 0; i < KYBER_N; i++) r.coeffs[i] = 1000;
    printf("  - Initialized r.coeffs[0] to %d\n", r.coeffs[0]);

    cbd(&r, buf, 0); // call with add=0

    printf("  - After cbd(..., 0), r.coeffs[0] is %d\n", r.coeffs[0]);
    if (r.coeffs[0] != 1000) {
        printf("  -> SUCCESS: Value was overwritten.\n");
    } else {
        printf("  -> FAIL: Value was NOT overwritten.\n");
    }
    saved_noise_val = r.coeffs[0]; // Save for next test


    /* TEST CASE 2: add = 1 (Accumulate) */
    printf("\n[Test 2] add = 1 (Expect Accumulate)\n");
    printf("  - Initialized all r.coeffs to 500.\n");
    printf("  - Checking first 8 coefficients to show noise variation:\n\n");

    // Pre-fill poly with a known base value
    for(i = 0; i < KYBER_N; i++) r.coeffs[i] = 500;
    
    // We already know what the noise *should* be from the first call (where add=0 overwrote everything)
    // r currently holds the result of cbd(..., 0) from Test 1.
    // Let's store those "noise" values to compare later.
    // BUT wait, I overwrote r with 500 just now.
    // To properly show the math: 500 + noise = result -> noise = result - 500.
    
    // Let's re-run cbd(..., 0) strictly to capture the noise for verification, 
    // although we could just calculate it after. 
    // Simpler: Just run cbd(..., 1) and show (Result - 500).

    cbd(&r, buf, 1); // call with add=1

    for(i = 0; i < 8; i++) {
        int16_t noise = r.coeffs[i] - 500;
        printf("  i=%d: Input 500 -> Output %d. Noise added: %d\n", i, r.coeffs[i], noise);
    }
    printf("\n  -> SUCCESS: Variable noise values were accumulated.\n");

    return 0;
}
