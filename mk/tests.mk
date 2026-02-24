# SPDX-License-Identifier: Apache-2.0 or CC0-1.0
ifeq ($(AIO),1)
elf/boardtest.elf: common/test.c $(LINKDEPS) $(CONFIG)
	$(compiletest)

elf/boardtest-fast.elf: common/testfast.c $(LINKDEPS) $(CONFIG)
	$(compiletest)

elf/boardtest-fast.elf: CPPFLAGS += -DCLOCK_TEST=CLOCK_FAST

elf/aestest.elf: common/aestest.c $(LINKDEPS) $(CONFIG)
	$(compiletest)

elf/keccaktest.elf: common/keccaktest.c $(LINKDEPS) $(CONFIG)
	$(compiletest)
else
elf/boardtest.elf: $(call objs,common/test.c) $(LINKDEPS) $(CONFIG)

elf/boardtest-fast.elf: $(call objs,common/testfast.c) $(LINKDEPS) $(CONFIG)

$(call objs,common/testfast.c): CPPFLAGS += -DCLOCK_TEST=CLOCK_FAST

elf/aestest.elf: $(call objs,common/aestest.c) $(LINKDEPS) $(CONFIG)

elf/keccaktest.elf: $(call objs,common/keccaktest.c) $(LINKDEPS) $(CONFIG)
endif

tests: elf/boardtest.elf elf/aestest.elf elf/keccaktest.elf
tests-bin: bin/boardtest.bin bin/aestest.bin bin/keccaktest.bin

# Custom test to print KEM values
TEST_PRINT_KEYS_C_SOURCES = \
    test_print_keys.c \
    crypto_kem/ml-kem-768/m4fspeed/cbd.c \
    crypto_kem/ml-kem-768/m4fspeed/indcpa.c \
    crypto_kem/ml-kem-768/m4fspeed/kem.c \
    crypto_kem/ml-kem-768/m4fspeed/matacc.c \
    crypto_kem/ml-kem-768/m4fspeed/ntt.c \
    crypto_kem/ml-kem-768/m4fspeed/poly.c \
    crypto_kem/ml-kem-768/m4fspeed/polyvec.c \
    crypto_kem/ml-kem-768/m4fspeed/symmetric-fips202.c \
    crypto_kem/ml-kem-768/m4fspeed/verify.c \
    mupq/common/fips202.c \
    common/hal-opencm3.c \
    common/randombytes.c

TEST_PRINT_KEYS_S_SOURCES = \
    crypto_kem/ml-kem-768/m4fspeed/cmov_int16.S \
    crypto_kem/ml-kem-768/m4fspeed/fastaddsub.S \
    crypto_kem/ml-kem-768/m4fspeed/fastbasemul.S \
    crypto_kem/ml-kem-768/m4fspeed/fastinvntt.S \
    crypto_kem/ml-kem-768/m4fspeed/fastntt.S \
    crypto_kem/ml-kem-768/m4fspeed/matacc_asm.S \
    crypto_kem/ml-kem-768/m4fspeed/poly_asm.S \
    crypto_kem/ml-kem-768/m4fspeed/reduce.S \
    common/keccakf1600.S

TEST_PRINT_KEYS_OBJS = $(call objs,$(TEST_PRINT_KEYS_C_SOURCES)) $(call objs,$(TEST_PRINT_KEYS_S_SOURCES))

elf/test_print_keys.elf: $(TEST_PRINT_KEYS_OBJS) $(LINKDEPS) $(CONFIG)

$(TEST_PRINT_KEYS_OBJS): CFLAGS += -Icrypto_kem/ml-kem-768/m4fspeed -Imupq/common

# Custom test for glitch attack
TEST_GLITCH_C_SOURCES = \
    test_glitch.c \
    crypto_kem/ml-kem-768/m4fspeed/cbd.c \
    crypto_kem/ml-kem-768/m4fspeed/indcpa.c \
    crypto_kem/ml-kem-768/m4fspeed/kem.c \
    crypto_kem/ml-kem-768/m4fspeed/matacc.c \
    crypto_kem/ml-kem-768/m4fspeed/ntt.c \
    crypto_kem/ml-kem-768/m4fspeed/poly.c \
    crypto_kem/ml-kem-768/m4fspeed/polyvec.c \
    crypto_kem/ml-kem-768/m4fspeed/symmetric-fips202.c \
    crypto_kem/ml-kem-768/m4fspeed/verify.c \
    mupq/common/fips202.c \
    common/hal-opencm3.c \
    common/randombytes.c

TEST_GLITCH_S_SOURCES = \
    crypto_kem/ml-kem-768/m4fspeed/cmov_int16.S \
    crypto_kem/ml-kem-768/m4fspeed/fastaddsub.S \
    crypto_kem/ml-kem-768/m4fspeed/fastbasemul.S \
    crypto_kem/ml-kem-768/m4fspeed/fastinvntt.S \
    crypto_kem/ml-kem-768/m4fspeed/fastntt.S \
    crypto_kem/ml-kem-768/m4fspeed/matacc_asm.S \
    crypto_kem/ml-kem-768/m4fspeed/poly_asm.S \
    crypto_kem/ml-kem-768/m4fspeed/reduce.S \
    common/keccakf1600.S

TEST_GLITCH_OBJS = $(call objs,$(TEST_GLITCH_C_SOURCES)) $(call objs,$(TEST_GLITCH_S_SOURCES))

elf/test_glitch.elf: $(TEST_GLITCH_OBJS) $(LINKDEPS) $(CONFIG)

$(TEST_GLITCH_OBJS): CFLAGS += -Icrypto_kem/ml-kem-768/m4fspeed -Imupq/common

# Custom test for sanity check
TEST_SANITY_C_SOURCES = \
    test_sanity.c \
    common/hal-opencm3.c \
    common/randombytes.c

TEST_SANITY_OBJS = $(call objs,$(TEST_SANITY_C_SOURCES))

elf/test_sanity.elf: $(TEST_SANITY_OBJS) $(LINKDEPS) $(CONFIG)

$(TEST_SANITY_OBJS): CFLAGS += -Icrypto_kem/ml-kem-768/m4fspeed -Imupq/common