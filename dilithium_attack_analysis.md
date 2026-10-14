# Analysis: Dilithium Rejection Sampling Fault Attack

This document explains the technical details of the fault injection attack we are currently performing on the Dilithium (ML-DSA) signature scheme.

## 1. The Core Problem: Rejection Sampling
In lattice-based signature schemes like Dilithium, the signature consists of a vector $z$ which is calculated as:
$$z = y + c \cdot s_1$$
Where:
- $y$ is a random secret (the masked nonce).
- $c$ is the challenge (a hash of the message and public key).
- $s_1$ is the secret key.

To ensure that the signature $z$ does not leak information about the secret key $s_1$, Dilithium must ensure that the values of $z$ follow a very specific distribution (a uniform distribution within a certain bound). If a coefficient in $z$ is too large (specifically, if $|z| \ge \gamma_1 - \beta$), it could potentially reveal the "shape" of the secret key $s_1$.

To prevent this, the algorithm use **Rejection Sampling**:
1. Calculate $z$.
2. Check if $z$ is within the safe bounds.
3. **If NO:** Discard $z$ (reject) and restart the entire signing process with a new random $y$.
4. **If YES:** Output the signature.

## 2. The Attack: Instruction Skip
The goal of our fault attack is to subvert this security check using **Clock Glitching**.

### The Targeted Code (`sign.c`)
In the `m4fstack` implementation, the check looks like this:
```c
if(poly_chknorm(tmp0, GAMMA1 - BETA)) {
    goto rej; // We want to SKIP this line
}
```

### The Fault Mechanism
By injecting a high-frequency clock glitch at the exact moment the CPU is executing the `if` branch or the `goto` jump, we cause a momentary timing violation in the CPU's internal pipeline. 
- Usually, this causes the CPU to incorrectly evaluate the condition as "False" even if it was "True".
- Or, it skips the `B` (Branch) or `BNE` (Branch Not Equal) assembly instruction entirely.

**Result:** The CPU "falls through" the check and continues to the signing output, even though the signature is mathematically insecure!

## 3. Why this leaks the Secret Key
If an attacker triggers this fault multiple times, they collect a set of signatures that **should have been rejected**. 

Specifically, in these faulty signatures, we know that:
$$z = y + c \cdot s_1$$
Where at least one coefficient of $z$ is unusually large. Because we know $z$ and we know the challenge hash $c$, we can start to "guess" or solve for $s_1$. 

In the **Loo-Kwong Attack (2021-840)**:
- Every time we get a signature where $z$ violated the bound, we gain a linear inequality about the secret key $s_1$.
- With enough glitched signatures (usually between 10 to 50), the attacker can recover the entire secret key $s_1$ using a hidden Markov model or lattice reduction.

## 4. Our Implementation Logic
To make this work on the STM32F3 board, we implemented several layers:

### A. Deterministic Firmware
Normally, Dilithium is randomized. If every signature is different, we can't tell if a change was caused by a glitch or just random chance. We disabled `randombytes` to ensure every "Normal" signature is identical (the **GOLD/BASELINE** baseline).

### B. Localized Hardware Trigger
Dilithium takes millions of cycles to run. To find the "Rejection Check" window, we injected `hal_trigger_toggle()` inside `sign.c` directly around the `poly_chknorm` loop. This allows the ChipWhisperer to fire the glitch at the exact nanosecond the check starts.

### C. Mathematical Verification (`verify_leak.py`)
Because a glitch can also just corrupt random RAM/UART data, we don't trust the "Different" signatures blindly. We run our verification script which:
1. Unpacks the 18-bit coefficients from the signature.
2. Checks the absolute maximum value.
3. If it exceeds 131033 (ML-DSA-44 limit), we have **confirmed** a successful instruction skip.
