# Read the synthesized netlist
read_verilog clocked_adder_synth.v

# Read the standard cell library
read_liberty sky130_fd_sc_hd__ff_n40C_1v65.lib

# Link the design to resolve references
link_design clocked_adder

# Read the design constraints
# read_sdc clocked_adder.sdc
create_clock -period 10 [get_ports clk]

# Manually estimate switching activity (you may have to estimate this externally)
# set_switching_activity 0.2

# Perform a simplified power analysis based on the static power and estimated switching activity
report_power

# could be used to estimate latency?
# report_checks -path_delay max -group_count 5