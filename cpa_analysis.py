#!/usr/bin/env python3
"""
CPA Analysis Script for Kyber768 Glitch Attack
Analyzes power traces to find the exact clock cycle of the negs instruction.

The negs instruction (b = -b) is the first operation in cmov() after trigger.
Its power consumption differs based on whether fail=0 or fail=1 (the mask value).

Since our firmware always has fail=1 (corrupted ciphertext), we use a different
approach: correlate with known intermediate values or simply find the power
signature of the negs operation by looking at distinctive patterns.

For this single-group CPA, we:
1. Load traces and examine the trigger window
2. Find the sample with highest variance (likely the negs instruction)
3. Calculate the offset from trigger to target instruction
"""

import numpy as np
import matplotlib
matplotlib.use('Agg')  # Non-interactive backend
import matplotlib.pyplot as plt
import os
import argparse
from glob import glob

def load_traces(trace_dir):
    """Load the most recent traces from directory."""
    trace_files = sorted(glob(f"{trace_dir}/traces_*.npy"))
    if not trace_files:
        raise FileNotFoundError(f"No trace files found in {trace_dir}")
    
    latest = trace_files[-1]
    print(f"Loading: {latest}")
    traces = np.load(latest)
    
    # Try to load corresponding fail bits
    fail_file = latest.replace("traces_", "fail_bits_")
    if os.path.exists(fail_file):
        fail_bits = np.load(fail_file)
        print(f"Loaded fail bits: {fail_file}")
    else:
        fail_bits = None
    
    return traces, fail_bits

def analyze_variance(traces):
    """
    Find samples with highest variance - these indicate data-dependent operations.
    The negs instruction should show variance if fail bit differs across traces.
    """
    variance = np.var(traces, axis=0)
    return variance

def find_negs_candidates(traces, top_n=5):
    """
    Find candidate sample indices for the negs instruction.
    
    Returns:
        list of (sample_index, variance) tuples
    """
    variance = analyze_variance(traces)
    
    # Find peaks in variance
    # Skip first few samples (noise during trigger edge)
    start_idx = 10
    
    candidates = []
    for i in range(start_idx, len(variance) - 1):
        # Look for local maxima
        if variance[i] > variance[i-1] and variance[i] > variance[i+1]:
            candidates.append((i, variance[i]))
    
    # Sort by variance (descending)
    candidates.sort(key=lambda x: x[1], reverse=True)
    
    return candidates[:top_n]

def estimate_ext_offset(sample_idx, adc_freq=96000000, clkgen_freq=24000000):
    """
    Convert sample index to ext_offset parameter.
    
    ADC samples at 4x the clock frequency.
    ext_offset is in clock cycles from trigger.
    
    Args:
        sample_idx: Sample index in trace
        adc_freq: ADC sample rate (Hz)
        clkgen_freq: Target clock frequency (Hz)
    
    Returns:
        Estimated ext_offset value
    """
    # ADC oversampling ratio
    oversample = adc_freq / clkgen_freq  # Should be ~4
    
    # Convert sample to clock cycles
    clock_cycles = sample_idx / oversample
    
    return int(clock_cycles)

def plot_analysis(traces, variance, candidates, output_dir):
    """Generate analysis plots."""
    os.makedirs(output_dir, exist_ok=True)
    
    # Plot 1: Mean trace with variance overlay
    fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(14, 8), sharex=True)
    
    mean_trace = np.mean(traces, axis=0)
    
    ax1.plot(mean_trace, 'b-', linewidth=0.5, label='Mean trace')
    ax1.set_ylabel('Power (ADC counts)')
    ax1.set_title('Mean Power Trace During cmov() Execution')
    ax1.legend()
    ax1.grid(True, alpha=0.3)
    
    ax2.plot(variance, 'r-', linewidth=0.5, label='Variance')
    
    # Mark candidate positions
    for i, (idx, var) in enumerate(candidates):
        ax2.axvline(x=idx, color='g', linestyle='--', alpha=0.7)
        ax2.annotate(f'#{i+1}\nidx={idx}', (idx, var), textcoords="offset points",
                    xytext=(5, 10), fontsize=8)
    
    ax2.set_xlabel('Sample Index')
    ax2.set_ylabel('Variance')
    ax2.set_title('Trace Variance (High variance = data-dependent operation)')
    ax2.legend()
    ax2.grid(True, alpha=0.3)
    
    plt.tight_layout()
    plt.savefig(f"{output_dir}/cpa_analysis.png", dpi=150)
    print(f"Saved: {output_dir}/cpa_analysis.png")
    
    # Plot 2: Zoom on first 200 samples (trigger window)
    fig, ax = plt.subplots(figsize=(12, 4))
    zoom_end = min(200, len(mean_trace))
    
    for i in range(min(10, len(traces))):
        ax.plot(traces[i][:zoom_end], alpha=0.3, linewidth=0.5)
    
    ax.plot(mean_trace[:zoom_end], 'k-', linewidth=1.5, label='Mean')
    
    for i, (idx, var) in enumerate(candidates):
        if idx < zoom_end:
            ax.axvline(x=idx, color='r', linestyle='--', alpha=0.7, label=f'Candidate {i+1}' if i==0 else None)
    
    ax.set_xlabel('Sample Index')
    ax.set_ylabel('Power (ADC counts)')
    ax.set_title('Trigger Window (First 200 samples) - Focus on negs location')
    ax.grid(True, alpha=0.3)
    ax.legend()
    
    plt.tight_layout()
    plt.savefig(f"{output_dir}/trigger_window.png", dpi=150)
    print(f"Saved: {output_dir}/trigger_window.png")
    
    plt.close('all')

def main():
    parser = argparse.ArgumentParser(description='CPA analysis to find negs instruction timing')
    parser.add_argument('--traces', type=str, default='traces_cpa', help='Directory with trace files')
    parser.add_argument('--output', type=str, default='cpa_results', help='Output directory for plots')
    args = parser.parse_args()
    
    print("="*60)
    print("CPA ANALYSIS FOR NEGS INSTRUCTION")
    print("="*60)
    
    try:
        traces, fail_bits = load_traces(args.traces)
    except FileNotFoundError as e:
        print(f"Error: {e}")
        print("\nRun collect_traces.py first to collect traces.")
        return
    
    print(f"Traces shape: {traces.shape}")
    print(f"Number of traces: {len(traces)}")
    print(f"Samples per trace: {traces.shape[1] if len(traces.shape) > 1 else len(traces[0])}")
    
    # Analyze variance
    print("\nAnalyzing trace variance...")
    candidates = find_negs_candidates(traces)
    
    print("\n" + "="*60)
    print("TOP CANDIDATE SAMPLE INDICES FOR negs INSTRUCTION:")
    print("="*60)
    
    for i, (idx, var) in enumerate(candidates):
        ext_offset = estimate_ext_offset(idx)
        print(f"  #{i+1}: Sample {idx:4d} | Variance: {var:.2f} | Est. ext_offset: {ext_offset}")
    
    # Best candidate
    if candidates:
        best_idx, best_var = candidates[0]
        best_ext_offset = estimate_ext_offset(best_idx)
        
        print("\n" + "="*60)
        print("RECOMMENDED PARAMETERS:")
        print("="*60)
        print(f"  ext_offset = {best_ext_offset}")
        print(f"  (Based on sample index {best_idx})")
        print("")
        print("  For precision attack, try:")
        print(f"    ext_offset in range({max(1, best_ext_offset-3)}, {best_ext_offset+4})")
        print(f"    width = 1 to 3")
        print(f"    offset = -10 to 10 (fine sweep)")
        
        # Save results
        os.makedirs(args.output, exist_ok=True)
        with open(f"{args.output}/recommended_params.txt", "w") as f:
            f.write(f"ext_offset={best_ext_offset}\n")
            f.write(f"sample_idx={best_idx}\n")
            f.write(f"variance={best_var}\n")
            f.write(f"ext_offset_range={max(1, best_ext_offset-3)},{best_ext_offset+4}\n")
        print(f"\nSaved: {args.output}/recommended_params.txt")
    
    # Generate plots
    print("\nGenerating analysis plots...")
    variance = analyze_variance(traces)
    plot_analysis(traces, variance, candidates, args.output)
    
    print("\nCPA analysis complete!")

if __name__ == "__main__":
    main()
