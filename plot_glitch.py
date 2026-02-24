import numpy as np
import matplotlib.pyplot as plt
import os

def plot_glitch():
    if not os.path.exists("traces/glitched_trace.npy"):
        print("Error: traces/glitched_trace.npy not found. Run verify_success.py first.")
        return

    print("Loading traces...")
    normal = np.load("traces/normal_trace.npy")
    glitched = np.load("traces/glitched_trace.npy")
    
    print(f"Normal trace shape: {normal.shape}")
    print(f"Glitched trace shape: {glitched.shape}")
    
    plt.figure(figsize=(12, 6))
    plt.plot(normal, label="Normal (Failed/No Glitch)", alpha=0.7, linewidth=1)
    plt.plot(glitched, label="Glitched (Success)", alpha=0.7, linewidth=1, linestyle='--')
    
    # Highlight difference
    diff = np.abs(normal - glitched)
    # Find where difference is significant
    threshold = np.max(diff) * 0.5
    indices = np.where(diff > threshold)[0]
    
    if len(indices) > 0:
        plt.scatter(indices, glitched[indices], color='red', s=10, label="Difference > 50% max", zorder=5)
        print(f"Significant differences found at samples: {indices}")
        
        # Zoom in if clustered
        center = int(np.mean(indices))
        window = 200
        # plt.xlim(max(0, center - window), min(len(normal), center + window))
        
    plt.title("Power Analysis: Normal vs Glitched Execution (Kyber768 Instruction Skip)")
    plt.xlabel("Sample Index")
    plt.ylabel("Power/Voltage (ADC Value)")
    plt.legend()
    plt.grid(True)
    
    output_file = "glitch_plot.png"
    plt.savefig(output_file)
    print(f"Plot saved to {output_file}")

if __name__ == "__main__":
    plot_glitch()
