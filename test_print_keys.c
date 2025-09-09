#include "api.h"
#include "hal.h"
#include <string.h>

// use different names so we can have empty namespaces
#define MUPQ_CRYPTO_BYTES           CRYPTO_BYTES
#define MUPQ_CRYPTO_PUBLICKEYBYTES  CRYPTO_PUBLICKEYBYTES
#define MUPQ_CRYPTO_SECRETKEYBYTES  CRYPTO_SECRETKEYBYTES
#define MUPQ_CRYPTO_CIPHERTEXTBYTES CRYPTO_CIPHERTEXTBYTES
#define MUPQ_CRYPTO_ALGNAME CRYPTO_ALGNAME

#define MUPQ_crypto_kem_keypair crypto_kem_keypair
#define MUPQ_crypto_kem_enc crypto_kem_enc
#define MUPQ_crypto_kem_dec crypto_kem_dec

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
  unsigned char key_a[MUPQ_CRYPTO_BYTES], key_b[MUPQ_CRYPTO_BYTES];
  unsigned char pk[MUPQ_CRYPTO_PUBLICKEYBYTES];
  unsigned char sendb[MUPQ_CRYPTO_CIPHERTEXTBYTES];
  unsigned char sk_a[MUPQ_CRYPTO_SECRETKEYBYTES];

  hal_setup(CLOCK_FAST);

  hal_send_str("==========================\n");

  //Alice generates a public key
  MUPQ_crypto_kem_keypair(pk, sk_a);
  hal_send_str("DONE key pair generation!\n");

  //Bob derives a secret key and creates a response
  MUPQ_crypto_kem_enc(sendb, key_b, pk);
  hal_send_str("DONE encapsulation!\n");

  //Alice uses Bobs response to get her secret key
  MUPQ_crypto_kem_dec(key_a, sendb, sk_a);
  hal_send_str("DONE decapsulation!\n");

  print_hex("pk: ", pk, MUPQ_CRYPTO_PUBLICKEYBYTES);
  print_hex("sk_a: ", sk_a, MUPQ_CRYPTO_SECRETKEYBYTES);
  print_hex("ct: ", sendb, MUPQ_CRYPTO_CIPHERTEXTBYTES);
  print_hex("ss_b (bob): ", key_b, MUPQ_CRYPTO_BYTES);
  print_hex("ss_a (alice): ", key_a, MUPQ_CRYPTO_BYTES);

  if(memcmp(key_a, key_b, MUPQ_CRYPTO_BYTES))
  {
    hal_send_str("ERROR KEYS\n");
  }
  else
  {
    hal_send_str("OK KEYS\n");
  }

  hal_send_str("#\n");

  return 0;
}
