# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /workspaces/power-estimation/external/OpenSTA

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /workspaces/power-estimation/build

# Utility rule file for sta_swig_swig_compilation.

# Include the progress variables for this target.
include CMakeFiles/sta_swig_swig_compilation.dir/progress.make

CMakeFiles/sta_swig_swig_compilation: CMakeFiles/sta_swig.dir/StaAppTCL.stamp


CMakeFiles/sta_swig.dir/StaAppTCL.stamp: /workspaces/power-estimation/external/OpenSTA/dcalc/DelayCalc.i
CMakeFiles/sta_swig.dir/StaAppTCL.stamp: /workspaces/power-estimation/external/OpenSTA/graph/Graph.i
CMakeFiles/sta_swig.dir/StaAppTCL.stamp: /workspaces/power-estimation/external/OpenSTA/liberty/Liberty.i
CMakeFiles/sta_swig.dir/StaAppTCL.stamp: /workspaces/power-estimation/external/OpenSTA/network/Network.i
CMakeFiles/sta_swig.dir/StaAppTCL.stamp: /workspaces/power-estimation/external/OpenSTA/network/NetworkEdit.i
CMakeFiles/sta_swig.dir/StaAppTCL.stamp: /workspaces/power-estimation/external/OpenSTA/parasitics/Parasitics.i
CMakeFiles/sta_swig.dir/StaAppTCL.stamp: /workspaces/power-estimation/external/OpenSTA/power/Power.i
CMakeFiles/sta_swig.dir/StaAppTCL.stamp: /workspaces/power-estimation/external/OpenSTA/sdc/Sdc.i
CMakeFiles/sta_swig.dir/StaAppTCL.stamp: /workspaces/power-estimation/external/OpenSTA/sdf/Sdf.i
CMakeFiles/sta_swig.dir/StaAppTCL.stamp: /workspaces/power-estimation/external/OpenSTA/search/Search.i
CMakeFiles/sta_swig.dir/StaAppTCL.stamp: /workspaces/power-estimation/external/OpenSTA/spice/WriteSpice.i
CMakeFiles/sta_swig.dir/StaAppTCL.stamp: /workspaces/power-estimation/external/OpenSTA/tcl/Exception.i
CMakeFiles/sta_swig.dir/StaAppTCL.stamp: /workspaces/power-estimation/external/OpenSTA/tcl/StaTclTypes.i
CMakeFiles/sta_swig.dir/StaAppTCL.stamp: /workspaces/power-estimation/external/OpenSTA/util/Util.i
CMakeFiles/sta_swig.dir/StaAppTCL.stamp: /workspaces/power-estimation/external/OpenSTA/verilog/Verilog.i
CMakeFiles/sta_swig.dir/StaAppTCL.stamp: /workspaces/power-estimation/external/OpenSTA/app/StaApp.i
CMakeFiles/sta_swig.dir/StaAppTCL.stamp: /workspaces/power-estimation/external/OpenSTA/app/StaApp.i
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/workspaces/power-estimation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Swig compile app/StaApp.i for tcl"
	/usr/bin/cmake -E make_directory /workspaces/power-estimation/build /workspaces/power-estimation/build/CMakeFiles/sta_swig.dir
	/usr/bin/cmake -E touch /workspaces/power-estimation/build/CMakeFiles/sta_swig.dir/StaAppTCL.stamp
	/usr/bin/cmake -E env SWIG_LIB=/usr/share/swig3.0 /usr/bin/swig3.0 -tcl -module sta -namespace -prefix sta -I/workspaces/power-estimation/external/OpenSTA -outdir /workspaces/power-estimation/build -c++ -o /workspaces/power-estimation/build/CMakeFiles/sta_swig.dir/StaAppTCL_wrap.cxx /workspaces/power-estimation/external/OpenSTA/app/StaApp.i

sta_swig_swig_compilation: CMakeFiles/sta_swig_swig_compilation
sta_swig_swig_compilation: CMakeFiles/sta_swig.dir/StaAppTCL.stamp
sta_swig_swig_compilation: CMakeFiles/sta_swig_swig_compilation.dir/build.make

.PHONY : sta_swig_swig_compilation

# Rule to build all files generated by this target.
CMakeFiles/sta_swig_swig_compilation.dir/build: sta_swig_swig_compilation

.PHONY : CMakeFiles/sta_swig_swig_compilation.dir/build

CMakeFiles/sta_swig_swig_compilation.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sta_swig_swig_compilation.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sta_swig_swig_compilation.dir/clean

CMakeFiles/sta_swig_swig_compilation.dir/depend:
	cd /workspaces/power-estimation/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspaces/power-estimation/external/OpenSTA /workspaces/power-estimation/external/OpenSTA /workspaces/power-estimation/build /workspaces/power-estimation/build /workspaces/power-estimation/build/CMakeFiles/sta_swig_swig_compilation.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sta_swig_swig_compilation.dir/depend

