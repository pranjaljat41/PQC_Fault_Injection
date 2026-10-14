/*
 * find_seed.c - Dilithium Seed Scanner
 * 
 * Scans seed values 0-255 and reports which rejection checks
 * fail for nonce=0. We want a seed where exactly ONE check fails,
 * so a single clock glitch can produce a complete signature bypass.
 * 
 * Output format per seed:
 *   SEED=X z=P/F w0=P/F ct0=P/F h=P/F nonce=N
 */
#include "api.h"
#include "hal.h"
#include "sign.h"
#include "params.h"
#include "poly.h"
#include "packing.h"
#include "polyvec.h"
#include "smallpoly.h"
#include "stack.h"
#include "symmetric.h"
#include "smallntt.h"
#include "randombytes.h"
#include <string.h>
#include <stdint.h>

// We need to reimplement the signing loop with instrumentation
// but we can't easily call the internal functions without modifying sign.c.
// Instead, we'll use a simpler approach: modify the rnd[] in sign.c
// and call crypto_sign_signature with a custom "probe" mode.

// For each seed, we sign and check if the golden signature matches.
// If nonce=0 produces a valid sig (no rejection), we report "all pass".
// If rejection happens, we count the nonce to see how many iterations.

static uint8_t pk[CRYPTO_PUBLICKEYBYTES];
static uint8_t sk[CRYPTO_SECRETKEYBYTES];
static uint8_t sig[CRYPTO_BYTES];
static uint8_t msg[32];

// External variable to control the seed from here
// We'll set this before calling crypto_sign_signature
volatile uint8_t g_seed_byte = 0;

static void send_int(int val) {
    char buf[12];
    int i = 0;
    int neg = 0;
    
    if (val < 0) {
        neg = 1;
        val = -val;
    }
    if (val == 0) {
        buf[0] = '0';
        buf[1] = 0;
        hal_send_str(buf);
        return;
    }
    
    char tmp[12];
    while (val > 0 && i < 10) {
        tmp[i++] = '0' + (val % 10);
        val /= 10;
    }
    
    int j = 0;
    if (neg) buf[j++] = '-';
    for (int k = i - 1; k >= 0; k--) {
        buf[j++] = tmp[k];
    }
    buf[j] = 0;
    hal_send_str(buf);
}

int main(void)
{
    hal_setup(CLOCK_FAST);
    hal_send_str("INIT\n");
    
    // Fixed message
    for (int i = 0; i < 32; i++) msg[i] = i;
    
    // Generate keys (deterministic via our fixed randombytes)
    crypto_sign_keypair(pk, sk);
    hal_send_str("KEYS OK\n");
    
    // For each seed value, we need to know how many nonce iterations
    // the signer takes. We can do this by:
    // 1. Set the seed
    // 2. Sign 
    // 3. The golden signature from the test harness tells us the final nonce
    //
    // But we actually need to know if nonce=0 specifically fails.
    // The approach: We'll use the fact that sign.c reads g_seed_byte.
    // We modify sign.c to use g_seed_byte as the rnd[] fill value.
    //
    // For a practical approach, we just call sign and count the nonce
    // by measuring time or by having sign.c report it.
    
    // Simpler approach: just sign with each seed and compare signatures.
    // If nonce=0 passes all checks, the signature will be from nonce=0.
    // If nonce=0 fails, the signature is from a later nonce.
    // We can't directly tell which check failed without modifying sign.c.
    //
    // BEST approach: Modify sign.c to export a diagnostic counter.
    // We'll use a global variable that sign.c writes to.
    
    // For now, let's just report which seeds produce nonce=0 signatures
    // vs which need more iterations. The firmware modified sign.c will
    // print diagnostic info.
    
    for (int seed = 0; seed < 256; seed++) {
        g_seed_byte = (uint8_t)seed;
        
        size_t siglen;
        crypto_sign_signature(sig, &siglen, msg, 32, sk);
        
        // sign.c will print the diagnostic line for us
        // Format: SEED=X z_fail=N w0_fail=N ct0_fail=N h_fail=N final_nonce=N
    }
    
    hal_send_str("DONE\n");
    
    while(1) {
        __asm__ volatile("nop");
    }
    
    return 0;
}
