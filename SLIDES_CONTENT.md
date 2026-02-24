# Slide Content Draft

## Slide 1: Title
**Title**: Fault Injection Analysis of ML-KEM-768 (Kyber)
**Subtitle**: Progress Report on Instruction Skip Attacks
**Presenter**: [Your Name]
**Date**: [Date]

---

## Slide 2: Introduction
**Bullet Points**:
*   **Context**: NIST has standardized ML-KEM (Kyber) for Post-Quantum Cryptography.
*   **Threat Model**: Embedded devices are vulnerable to physical attacks (Side-Channel & Fault Injection).
*   **Objective**: Investigate the resilience of the reference implementation against Fault Injection Attacks (FIA).
*   **Specific Goal**: Replicate the "CMOV Skip" attack to bypass the implicit rejection mechanism.

---

## Slide 3: The Attack Mechanism
**Bullet Points**:
*   **Implicit Rejection**: Kyber does not return an error on failure.
    *   Success: Returns Shared Secret (`ss`).
    *   Failure: Returns Pseudorandom Key (`random_key`).
*   **The Vulnerability**: The decision is made by a `cmov` (conditional move) instruction.
    *   `cmov(ss, random_key, fail)`
*   **The Glitch**: If we skip the `cmov` instruction when `fail == 1`:
    *   The buffer `ss` retains its previous value.
    *   If the implementation defaults to the true key (a common optimization pattern), the attacker recovers the key.

---

## Slide 4: Experimental Setup (Hardware)
**Bullet Points**:
*   **Target**: STM32F303 (ARM Cortex-M4).
*   **Injector**: ChipWhisperer Lite (CW1173).
*   **Interface**: Serial (UART) for control, Clock Glitching via FPGA.
*   **Glitch Method**: Clock Glitching (inserting short pulses to violate setup/hold times).

*(Insert photo of your board setup here)*

---

## Slide 5: Firmware Architecture (The "Concrete" Work)
**Bullet Points**:
*   **Modifications**: Instrumented `crypto_kem/ml-kem-768/m4fspeed/kem.c`.
*   **Vulnerable Pattern**:
    ```c
    /* Default to True Key */
    memcpy(ss, kr, KYBER_SYMBYTES);

    /* Trigger & Conditional Overwrite */
    hal_trigger_toggle();
    cmov(ss, rejection_key, KYBER_SYMBYTES, fail);
    hal_trigger_toggle();
    ```
*   **Test Harness (`test_glitch.c`)**:
    1.  Generate Keypair.
    2.  Corrupt Ciphertext (Force `fail = 1`).
    3.  Loop Decapsulation.
    4.  Check if output matches `ss` (Success) or `random_key` (Normal).

---

## Slide 6: Attack Automation
**Bullet Points**:
*   **Control Script**: Python (`run_attack.py`) using ChipWhisperer API.
*   **Workflow**:
    1.  Program Target.
    2.  Verify Baseline (Normal Operation).
    3.  **Glitch Loop**:
        *   Vary `Width` (Pulse duration).
        *   Vary `Offset` (Phase shift).
        *   Vary `Ext_Offset` (Cycle delay from trigger).
    4.  Monitor for Resets (Crashes) or Success.

*(Insert screenshot of run_attack.py output showing "Progress: ... attempts")*

---

## Slide 7: Current Results
**Bullet Points**:
*   **Status**: Experimental testbed is fully operational.
*   **Observations**:
    *   Communication stable.
    *   Triggers are firing correctly around the target instruction.
    *   **Glitch Effects**: Observed target resets and communication timeouts, confirming that glitches are impacting the CPU pipeline.
*   **Result**: No successful instruction skip *yet*. The attack is probabilistic and requires precise tuning.

---

## Slide 8: Challenges & Next Steps
**Bullet Points**:
*   **Challenge 1: Search Space**: The parameter space (Width x Offset x Time) is vast.
*   **Challenge 2: Instruction Atomicity**: `cmov` in C compiles to multiple assembly instructions (looping over 32 bytes). Skipping the "decision" logic is non-trivial.
*   **Plan**:
    1.  **Power Analysis**: Use the ChipWhisperer to capture power traces and visually identify the `cmov` execution to narrow the timing window.
    2.  **Assembly Inspection**: Verify the compiled assembly to ensure the glitch targets the branch or the move instruction specifically.
    3.  **Refined Sweep**: Focus glitching on the exact cycles identified by power analysis.

---

## Slide 9: Conclusion
**Bullet Points**:
*   Successfully established a Fault Injection testbed for Kyber768.
*   Implemented and verified the vulnerable code pattern.
*   Currently in the "Parameter Tuning" phase of the attack.
*   Future work focuses on increasing timing precision using side-channel feedback.
