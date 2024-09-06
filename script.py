
import subprocess
# for pattern matching
import re

def create_yosys_synth_file(processing_element, process_library):
    # ie process_library = "sky130_fd_sc_hd__ff_n40C_1v65.lib"
    # verilog_file = "clocked_adder.v"

    content = f"""
    # Read the Verilog file
    read_verilog {processing_element}.v

    # Perform synthesis with a generic library
    synth -top {processing_element}

    # Map to standard cells (replace 'mycells.lib' with your library)
    dfflibmap -liberty {process_library}.lib
    abc -liberty {process_library}.lib

    # Write the gate-level netlist to a file
    write_verilog {processing_element}_synth.v
    """
    with open("synth.ys", "w") as f:
        f.write(content)

def create_power_opesta_tcl_file(verilog_file, process_library, clock_period):

    incl_switching_activity = False
    switching_activity = 0.2
    comment_sw = "# "
    if incl_switching_activity:
        comment_sw = ""

    debug = False
    comment_db = "# "
    if debug:
        comment_db = ""

    content=f"""
    # Read the synthesized netlist
    read_verilog {verilog_file}_synth.v

    # Read the standard cell library
    read_liberty {process_library}.lib

    # Link the design to resolve references, name of top level module
    link_design {verilog_file}

    # Read the design constraints
    # read_sdc clocked_adder.sdc
    create_clock -period {clock_period} [get_ports clk]

    # Manually estimate switching activity (you may have to estimate this externally)
    # switching activity, 0.2 normal??
    {comment_sw} set_power_activity -input -activity {switching_activity}
    # for example when a certain port will never toggle:
    # set_power_activity -input_port reset -activity 0.0
    read_power_activities -vcd {verilog_file}.vcd

    # debug statement
    {comment_db}check_setup -verbose

    # Perform a simplified power analysis based on the static power and estimated switching activity
    report_power

    # exit
    exit

    # report_checks
    # report_units
    # could be used to estimate latency?
    # report_checks -path_delay max -group_count 5
    """
    with open("power_analysis.tcl", "w") as f:
        f.write(content)

def run_tool(verilog_file, process_library, clock_period):
    # yosys -s synth.ys
    # iverilog -o clocked_adder clocked_adder_tb.v clocked_adder.v
    # vvp clocked_adder
    # sta power_sta.tcl

    # Create Yosys synthesis script
    create_yosys_synth_file(verilog_file, process_library)

    # Run Yosys
    yosys_cmd = "yosys -s synth.ys"
    subprocess.run(yosys_cmd, shell=True, check=True)

    # Run iVerilog
    iverilog_cmd = f"iverilog -o {verilog_file} {verilog_file}_tb.v {verilog_file}.v"
    subprocess.run(iverilog_cmd, shell=True, check=True)

    # Run VVP
    vvp_cmd = f"vvp {verilog_file}"
    subprocess.run(vvp_cmd, shell=True, check=True)

    # Create OpenSTA power analysis script
    create_power_opesta_tcl_file(verilog_file, process_library, clock_period)

    # Run OpenSTA
    opensta_cmd = "sta power_analysis.tcl"
    result = subprocess.run(opensta_cmd, shell=True, check=True, capture_output=True, text=True)


    # Pattern to match each row of the power data
    pattern = re.compile(r"(\w+)\s+([\d.e+-]+)\s+([\d.e+-]+)\s+([\d.e+-]+)\s+([\d.e+-]+)\s+([\d.e+-]+)%?")

    # Dictionary to store power data
    power_data = {}

    # Find all matches and store them in the dictionary
    for match in pattern.findall(result.stdout):
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


    return power_data


clk_freq = 15_700_000 #Hz
clk_period = 1 / clk_freq #s
clk_period_ns = clk_period * 1e9 #ns

result = run_tool(verilog_file="clocked_adder", 
                  process_library="sky130_fd_sc_hd__ff_n40C_1v65", 
                  clock_period=clk_period_ns)

print("\n\npy out\n\n")

for (key, value) in result.items():
    print(key, ":", value)
    
# print(clk_period)