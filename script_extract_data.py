input_string = """
OpenSTA 2.6.0 aafee90f8a Copyright (c) 2024, Parallax Software, Inc.
License GPLv3: GNU GPL version 3 <http://gnu.org/licenses/gpl.html>

This is free software, and you are free to change and redistribute it
under certain conditions; type `show_copying' for details. 
This program comes with ABSOLUTELY NO WARRANTY; for details type `show_warranty'.
Warning: sky130_fd_sc_hd__ff_n40C_1v65.lib line 23, default_fanout_load is 0.0.
Annotated 0 pin activities.
Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             2.14e-05   0.00e+00   9.85e-12   2.14e-05 100.0%
Combinational          4.78e-14   2.36e-14   9.08e-12   9.15e-12   0.0%
Clock                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  2.14e-05   2.36e-14   1.89e-11   2.14e-05 100.0%
                         100.0%       0.0%       0.0%
"""

# Extracting the relevant power data
import re

# Pattern to match each row of the power data
pattern = re.compile(r"(\w+)\s+([\d.e+-]+)\s+([\d.e+-]+)\s+([\d.e+-]+)\s+([\d.e+-]+)\s+([\d.e+-]+)%?")

# Dictionary to store power data
power_data = {}

# Find all matches and store them in the dictionary
for match in pattern.findall(input_string):
    group_name = match[0]
    internal_power = float(match[1])
    switching_power = float(match[2])
    leakage_power = float(match[3])
    total_power = float(match[4])
    percentage = float(match[5])
    
    # Store each entry in a nested dictionary
    power_data[group_name] = {
        'Internal Power': internal_power,
        'Switching Power': switching_power,
        'Leakage Power': leakage_power,
        'Total Power': total_power,
        'Percentage': percentage
    }

# Output the dictionary

for (key, value) in power_data.items():
    print(key, ":", value)
