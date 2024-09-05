import subprocess

def create_yosys_synth_file(verilog_file, process_library):
    # ie process_library = "sky130_fd_sc_hd__ff_n40C_1v65.lib"
    # verilog_file = "clocked_adder.v"

    content = f"""
    # Read the Verilog file
    read_verilog {verilog_file}

    # Perform synthesis with a generic library
    synth -top clocked_adder

    # Map to standard cells (replace 'mycells.lib' with your library)
    dfflibmap -liberty {process_library}
    abc -liberty {process_library}

    # Write the gate-level netlist to a file
    write_verilog -noattr {verilog_file}
    """
    with open("synth.ys", "w") as f:
        f.write(content)

def create_power_opesta_tcl_file(verilog_file, verilog_synth_file, top_level_module, process_library, clock_period):

    content=f"""
    # Read the synthesized netlist
    read_verilog {verilog_synth_file}

    # Read the standard cell library
    read_liberty {process_library}

    # Link the design to resolve references
    link_design {top_level_module}

    # Read the design constraints
    # read_sdc clocked_adder.sdc
    create_clock -period {clock_period} [get_ports clk]

    # Manually estimate switching activity (you may have to estimate this externally)
    # set_switching_activity 0.2

    # Perform a simplified power analysis based on the static power and estimated switching activity
    report_power
    """
    with open("power_analysis.tcl", "w") as f:
        f.write(content)

def run_yosys(verilog_file, top_module):
    cmd = f"yosys -p \"read_verilog {verilog_file}; synth -top {top_module}; write_verilog synth_design.v\""
    subprocess.run(cmd, shell=True, check=True)

def run_simulation(verilog_file, testbench_file):
    subprocess.run(f"iverilog -o sim_design.vvp {verilog_file} {testbench_file}", shell=True, check=True)
    subprocess.run("vvp sim_design.vvp", shell=True, check=True)

def create_sdc(clock_period):
    with open("constraints.sdc", "w") as f:
        f.write(f"create_clock -name clk -period {clock_period} [get_ports clk]\n")
        f.write("set_input_delay -clock clk 0 [all_inputs]\n")
        f.write("set_output_delay -clock clk 0 [all_outputs]\n")

def run_opensta(liberty_file, clock_period):
    create_sdc(clock_period)
    with open("power_analysis.tcl", "w") as f:
        f.write(f"read_liberty {liberty_file}\n")
        f.write("read_verilog synth_design.v\n")
        f.write("link_design your_module_name\n")
        f.write("read_sdc constraints.sdc\n")
        f.write("read_vcd dump.vcd\n")
        f.write("report_power\n")
    
    result = subprocess.run("sta power_analysis.tcl", shell=True, capture_output=True, text=True)
    return result.stdout

def extract_power(sta_output):
    match = re.search(r"Total\s+[\d.]+\s+(\d+\.\d+)", sta_output)
    if match:
        return float(match.group(1))
    return None

def estimate_power(verilog_file, testbench_file, top_module, liberty_file, clock_period):
    run_yosys(verilog_file, top_module)
    run_simulation(verilog_file, testbench_file)
    sta_output = run_opensta(liberty_file, clock_period)
    power = extract_power(sta_output)
    return power

# Example usage
verilog_file = "your_design.v"
testbench_file = "your_testbench.v"
top_module = "your_module_name"
liberty_file = "your_library.lib"
clock_period = 10  # in nanoseconds

power = estimate_power(verilog_file, testbench_file, top_module, liberty_file, clock_period)
print(f"Estimated total power: {power} W")