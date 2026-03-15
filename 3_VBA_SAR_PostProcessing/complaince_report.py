import os


def analyze_compliance():
    # 1. SMART PATH: Find the folder where THIS script is saved
    script_dir = os.path.dirname(os.path.abspath(__file__))
    file_path = os.path.join(script_dir, 'power_loss_data.txt')

    # 2. Check if the file actually exists before opening
    if not os.path.exists(file_path):
        print(f"ERROR: Could not find '{file_path}'")
        print("Make sure you exported the data from CST into this folder!")
        return

    # 3. Read the CST Export File
    with open(file_path, 'r') as f:
        lines = f.readlines()

    # 4. Extract the data (The last line contains the 2.4 GHz result)
    data_line = lines[-1].split()
    frequency = data_line[0]
    power_loss = float(data_line[1])

    # 5. Industry Logic: Safety Threshold (5.0e-07 W)
    threshold = 5.0e-07

    print(f"--- BioEM Safety Report ---")
    print(f"Frequency: {frequency} GHz")
    print(f"Total Absorbed Power: {power_loss:.4e} W")

    if power_loss < threshold:
        print("RESULT: PASSED (Within Safety Limits)")
    else:
        print("RESULT: FAILED (Exceeds Safety Threshold)")


# Run the analysis
if __name__ == "__main__":
    analyze_compliance()
