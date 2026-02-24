# Research Seminar Presentation Plan: Kyber Fault Injection

## Goal
To demonstrate concrete progress on the Fault Injection Attack (FIA) on Kyber768, despite not yet achieving a successful instruction skip. The focus will be on the **methodology**, **experimental setup**, and **deep understanding** of the attack surface.

## Strategy
1.  **Shift the Narrative**: Instead of "I failed to hack it," frame it as "I have built the complete testbed and am currently in the tuning phase."
2.  **Highlight the Code**: You have modified the cryptographic library (`kem.c`) to introduce a specific vulnerability pattern and added hardware triggers. This is non-trivial work.
3.  **Show the Data**: Present the search space you are exploring and the behavior you are observing (crashes vs. normal operation).

## Presentation Structure

### 1. Introduction (1-2 Slides)
*   **Topic**: Fault Injection Analysis of ML-KEM-768 (Kyber).
*   **Context**: Post-Quantum Cryptography is becoming standard (NIST). Physical attacks are a key concern.
*   **Objective**: Replicate a "CMOV Skip" attack to bypass the implicit rejection mechanism.

### 2. The Attack Vector (2 Slides)
*   **Concept**: Kyber uses "Implicit Rejection". If decryption fails, it returns a pseudorandom key instead of an error.
*   **The Target**: The `cmov` (conditional move) instruction.
*   **The Vulnerability**:
    *   Standard code: `cmov(ss, random_key, fail)`
    *   If we skip `cmov`, `ss` might remain as the "true" key (if the implementation uses a "default-to-true" pattern).

### 3. Implementation & Setup (The "Concrete" Part) (3-4 Slides)
*   **Hardware**: ChipWhisperer Lite + STM32F303 (Show a photo if possible).
*   **Firmware Modifications** (Crucial!):
    *   Show the code snippet from `kem.c` where you added `hal_trigger_toggle()` and the `memcpy(ss, kr, ...)` pattern.
    *   Explain: "I instrumented the reference implementation to isolate the vulnerable instruction."
*   **Test Harness**:
    *   Explain `test_glitch.c`: "Generates keys -> Corrupts Ciphertext -> Loops Decapsulation."
    *   This proves you understand how to simulate the attack scenario.

### 4. Experimental Results (2-3 Slides)
*   **Automation**: Show a screenshot of `run_attack.py` running.
*   **Search Space**: Explain the parameters:
    *   **Width**: Glitch pulse width.
    *   **Offset**: Timing relative to clock edge.
    *   **Ext_Offset**: Cycle count from trigger.
*   **Observations**:
    *   "Baseline operation verified."
    *   "Glitch injection successful (Target resets observed)."
    *   "Current Status: Exploring the parameter space to find the exact skip window."

### 5. Challenges & Future Work (1-2 Slides)
*   **Challenge**: The `cmov` operation is a loop (processing 32 bytes). Skipping one instruction might not be sufficient or might cause a crash instead of a clean skip.
*   **Challenge**: Timing jitter. Even with local triggers, the pipeline state varies.
*   **Next Steps**:
    *   Power Trace Analysis: Visualize the power consumption to pinpoint the exact cycle of `cmov`.
    *   Refine Glitch Parameters: Use the crash data to map the "danger zone" and search near it.

## Artifacts to Prepare
1.  **Code Snippet**: `kem.c` (lines 157-163).
2.  **Screenshot**: Terminal output of `run_attack.py` showing "Progress: ...".
3.  **Diagram**: A simple block diagram of [PC] <-> [ChipWhisperer] <-> [STM32].
