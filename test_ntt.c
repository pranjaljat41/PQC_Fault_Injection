#include <stdint.h>
#include <string.h>

#include "hal.h"
#include "sendfn.h"
#include "crypto_kem/ml-kem-768/m4fspeed/params.h"
#include "crypto_kem/ml-kem-768/m4fspeed/ntt.h"

int main(void) {
    hal_setup(CLOCK_BENCHMARK);

    // Declare two polynomials
    int16_t poly[KYBER_N];
    int16_t poly_original[KYBER_N];

    // Initialize the polynomial with some data
    for (int i = 0; i < KYBER_N; i++) {
        poly[i] = i;
    }

    // Make a copy for later comparison
    memcpy(poly_original, poly, sizeof(poly));

    // Perform forward and inverse NTT
    ntt(poly);
    invntt(poly);

    // Check if the result matches the original
    int success = 1;
    for (int i = 0; i < KYBER_N; i++) {
        if (poly[i] != poly_original[i]) {
            success = 0;
            break;
        }
    }

    if (success) {
        hal_send_str("SUCCESS");
    } else {
        hal_send_str("FAILURE");
    }

    return 0;
}