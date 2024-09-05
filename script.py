import subprocess

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

    switching_activity = 0.2

    debug = False
    comment = ""
    if not debug:
        comment = "# "

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
    # set_power_activity -input -activity {switching_activity}
    # for example when a certain port will never toggle:
    # set_power_activity -input_port reset -activity 0.0
    read_power_activities -vcd {verilog_file}.vcd

    # debug statement
    {comment}check_setup -verbose

    # Perform a simplified power analysis based on the static power and estimated switching activity
    report_power

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
    subprocess.run(opensta_cmd, shell=True, check=True)

    # quit opensta
    quit_cmd = "quit"
    subprocess.run(quit_cmd, shell=True, check=True)


run_tool("clocked_adder", "sky130_fd_sc_hd__ff_n40C_1v65", 10)

# def run_yosys(verilog_file, top_module):
#     cmd = f"yosys -p \"read_verilog {verilog_file}; synth -top {top_module}; write_verilog synth_design.v\""
#     subprocess.run(cmd, shell=True, check=True)

# def run_simulation(verilog_file, testbench_file):
#     subprocess.run(f"iverilog -o sim_design.vvp {verilog_file} {testbench_file}", shell=True, check=True)
#     subprocess.run("vvp sim_design.vvp", shell=True, check=True)

# def create_sdc(clock_period):
#     with open("constraints.sdc", "w") as f:
#         f.write(f"create_clock -name clk -period {clock_period} [get_ports clk]\n")
#         f.write("set_input_delay -clock clk 0 [all_inputs]\n")
#         f.write("set_output_delay -clock clk 0 [all_outputs]\n")

# def run_opensta(liberty_file, clock_period):
#     create_sdc(clock_period)
#     with open("power_analysis.tcl", "w") as f:
#         f.write(f"read_liberty {liberty_file}\n")
#         f.write("read_verilog synth_design.v\n")
#         f.write("link_design your_module_name\n")
#         f.write("read_sdc constraints.sdc\n")
#         f.write("read_vcd dump.vcd\n")
#         f.write("report_power\n")
    
#     result = subprocess.run("sta power_analysis.tcl", shell=True, capture_output=True, text=True)
#     return result.stdout

# def extract_power(sta_output):
#     match = re.search(r"Total\s+[\d.]+\s+(\d+\.\d+)", sta_output)
#     if match:
#         return float(match.group(1))
#     return None

# def estimate_power(verilog_file, testbench_file, top_module, liberty_file, clock_period):
#     run_yosys(verilog_file, top_module)
#     run_simulation(verilog_file, testbench_file)
#     sta_output = run_opensta(liberty_file, clock_period)
#     power = extract_power(sta_output)
#     return power

# # Example usage
# verilog_file = "your_design.v"
# testbench_file = "your_testbench.v"
# top_module = "your_module_name"
# liberty_file = "your_library.lib"
# clock_period = 10  # in nanoseconds

# power = estimate_power(verilog_file, testbench_file, top_module, liberty_file, clock_period)
# print(f"Estimated total power: {power} W")