#include "api.h"
#include "hal.h"
#include <string.h>
#include "randombytes.h"

// Kyber768 Parameters
#define CRYPTO_BYTES 32
#define CRYPTO_PUBLICKEYBYTES 1184
#define CRYPTO_SECRETKEYBYTES 2400
#define CRYPTO_CIPHERTEXTBYTES 1088

static void print_hex(const char *label, const uint8_t *data, size_t len) {
    const char hex_chars[] = "0123456789abcdef";
    char out[len*2+1];
    for(size_t i=0; i<len; i++) {
        out[i*2]   = hex_chars[(data[i] >> 4) & 0xF];
        out[i*2+1] = hex_chars[data[i] & 0xF];
    }
    out[len*2] = 0;
    hal_send_str(label);
    hal_send_str(out);
    hal_send_str("\n");
}

int main(void)
{
  unsigned char pk[CRYPTO_PUBLICKEYBYTES];
  unsigned char sk[CRYPTO_SECRETKEYBYTES];
  unsigned char ct[CRYPTO_CIPHERTEXTBYTES];
  unsigned char ss[CRYPTO_BYTES];
  unsigned char ss_gold[CRYPTO_BYTES];

  hal_setup(CLOCK_FAST);
  
  hal_send_str("INIT\n");



  // Generate keys
  crypto_kem_keypair(pk, sk);
  hal_send_str("KEYS GENERATED\n");
  
  // Encapsulate to get valid ct and ss
  crypto_kem_enc(ct, ss_gold, pk);
  
  print_hex("GOLD: ", ss_gold, CRYPTO_BYTES);
  
  // Modify ciphertext to force rejection (unless skipped)
  // ct[0] ^= 0x55; // Previously failed to trigger rejection
  ct[CRYPTO_CIPHERTEXTBYTES - 1] ^= 0xFF;

  while(1) {
      hal_send_str("WAIT\n");
      // Trigger is inside dec
      crypto_kem_dec(ss, ct, sk);
      print_hex("KEY: ", ss, CRYPTO_BYTES);
  }

  return 0;
}
