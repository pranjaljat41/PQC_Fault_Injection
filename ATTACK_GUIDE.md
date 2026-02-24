# Kyber768 Fault Injection Attack Guide

This guide details the steps to build, run, and tune the instruction skip attack on Kyber768 using a ChipWhisperer Lite and STM32F303 target.

## 1. Getting Started

### Prerequisites
*   **Hardware**: ChipWhisperer Lite (CW1173) connected to a CW308 UFO board with the STM32F303 target.
*   **Software**: `pqm4` environment with `arm-none-eabi-gcc` and `chipwhisperer` Python package installed.

### Step 1: Build the Firmware
Compile the custom test firmware that includes the trigger logic.

```bash
cd /home/pranjal-jat/pqm4
make PLATFORM=cw308t-stm32f3 test-glitch
```

This will generate the binary file `bin/test_glitch.hex`.

### Step 2: Run the Attack
Execute the Python script to program the target and start the glitch loop.

```bash
python3 run_attack.py
```

The script will:
1.  Flash `bin/test_glitch.hex` to the STM32F3.
2.  Verify serial communication by reading a baseline key.
3.  Begin iterating through glitch parameters.

## 2. Interpreting the Output

### Baseline Key
When the script starts, it performs a "normal" run without glitches. You should see:
```
Baseline Key: 9520795cec4b... (64 hex characters)
```
This confirms that the target is programmed, running, and communicating correctly.

### Attack Loop
The script iterates through glitch parameters:
*   **w (Width)**: The width of the glitch pulse (as a percentage of the clock period).
*   **o (Offset)**: The delay of the glitch pulse relative to the clock edge (as a percentage).

**Successful Glitch:**
If the attack succeeds (i.e., the instruction is skipped), the target will return a *different* key than the baseline. The script will print:
```
SUCCESS! w=10, o=-15
Normal:   9520795c...
Glitched: 4b863d71...
```
The "Glitched" key is the key derived from the *decrypted* message (which was chosen to be invalid), bypassing the implicit rejection check.

**Failures:**
If the glitch has no effect, the key remains the same. The script silently continues (or prints "Fail" if you uncomment that line).
If the glitch crashes the target, the script attempts to reset it and continue.

## 3. Modifying Parameters

Open `run_attack.py` to adjust the search ranges.

### Search Ranges
Look for this section:
```python
# Parameters to search
width_range = range(5, 45, 1) # % of period
offset_range = range(-45, 45, 1) # % of period
```

*   **Coarse Search**: Start with large ranges and a step of 1 or 2 (e.g., `range(-45, 45, 2)`).
*   **Fine Tuning**: Once you find a glitch that causes a crash or a success, narrow the range around those values with a step of 0.5 or smaller (if supported) or just 1.
    *   *Note*: ChipWhisperer Lite phase shift resolution is limited, so integer steps are usually fine.

### Repeat Count
```python
scope.glitch.repeat = 1
```
*   **1**: Standard for instruction skips.
*   **2-5**: Can be used if a single pulse isn't strong enough, but increases the risk of crashing the device.

## 4. Troubleshooting

### "Partial reconfiguration for offset = 0 may not work"
This is a standard warning from the ChipWhisperer FPGA when the offset is exactly 0. You can ignore it, or change your range to avoid 0 (e.g., `range(1, 45)`).

### "Target stopped responding"
This means a glitch crashed the STM32F3. The script automatically pulls the reset line (`nrst`) low to reboot it. If this happens frequently:
*   The glitch might be too strong (width too high).
*   You might be hitting a sensitive part of the clock cycle.

### No Success Found?
Fault injection is probabilistic.
1.  **Widen the Range**: Try negative widths or larger offsets.
2.  **Check Trigger**: Ensure the trigger is close to the target instruction. In `kem.c`, we placed `hal_trigger_toggle()` right around `cmov`.
3.  **Voltage Glitching**: If clock glitching doesn't work, you can switch to voltage glitching (requires hardware setup change usually, but CW-Lite supports it via the "crowbar" MOSFET). Change `scope.glitch.output` to `"enable_only"` (and configure the crowbar logic, which is more complex).
Progress: 15900 attempts (ext=3, w=36, o=40)
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipWhisperer Scope WARNING|File _OpenADCInterface.py:732) Timeout in OpenADC capture(), no trigger seen! Trigger forced, data is invalid. Status: ff
(ChipW