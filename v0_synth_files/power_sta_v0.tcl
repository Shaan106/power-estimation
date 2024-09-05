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
# switching activity, 0.2 normal??
set_power_activity -input -activity 0.2
# for example when a certain port will never toggle:
# set_power_activity -input_port reset -activity 0.0
read_power_activities -vcd clocked_adder.vcd

# debug statement
# check_setup -verbose

# get_clocks clk
user_run_time

# Perform a simplified power analysis based on the static power and estimated switching activity
report_power

# report_checks
# report_units
# could be used to estimate latency?
# report_checks -path_delay max -group_count 5