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

# Include any dependencies generated for this target.
include CMakeFiles/sta_swig.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/sta_swig.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sta_swig.dir/flags.make

CMakeFiles/sta_swig.dir/CMakeFiles/sta_swig.dir/StaAppTCL_wrap.cxx.o: CMakeFiles/sta_swig.dir/flags.make
CMakeFiles/sta_swig.dir/CMakeFiles/sta_swig.dir/StaAppTCL_wrap.cxx.o: CMakeFiles/sta_swig.dir/StaAppTCL_wrap.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspaces/power-estimation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/sta_swig.dir/CMakeFiles/sta_swig.dir/StaAppTCL_wrap.cxx.o"
	/usr/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Wno-cast-qual -Wno-missing-braces -Wno-deprecated-declarations -o CMakeFiles/sta_swig.dir/CMakeFiles/sta_swig.dir/StaAppTCL_wrap.cxx.o -c /workspaces/power-estimation/build/CMakeFiles/sta_swig.dir/StaAppTCL_wrap.cxx

CMakeFiles/sta_swig.dir/CMakeFiles/sta_swig.dir/StaAppTCL_wrap.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sta_swig.dir/CMakeFiles/sta_swig.dir/StaAppTCL_wrap.cxx.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Wno-cast-qual -Wno-missing-braces -Wno-deprecated-declarations -E /workspaces/power-estimation/build/CMakeFiles/sta_swig.dir/StaAppTCL_wrap.cxx > CMakeFiles/sta_swig.dir/CMakeFiles/sta_swig.dir/StaAppTCL_wrap.cxx.i

CMakeFiles/sta_swig.dir/CMakeFiles/sta_swig.dir/StaAppTCL_wrap.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sta_swig.dir/CMakeFiles/sta_swig.dir/StaAppTCL_wrap.cxx.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Wno-cast-qual -Wno-missing-braces -Wno-deprecated-declarations -S /workspaces/power-estimation/build/CMakeFiles/sta_swig.dir/StaAppTCL_wrap.cxx -o CMakeFiles/sta_swig.dir/CMakeFiles/sta_swig.dir/StaAppTCL_wrap.cxx.s

# Object files for target sta_swig
sta_swig_OBJECTS = \
"CMakeFiles/sta_swig.dir/CMakeFiles/sta_swig.dir/StaAppTCL_wrap.cxx.o"

# External object files for target sta_swig
sta_swig_EXTERNAL_OBJECTS =

sta_swig.a: CMakeFiles/sta_swig.dir/CMakeFiles/sta_swig.dir/StaAppTCL_wrap.cxx.o
sta_swig.a: CMakeFiles/sta_swig.dir/build.make
sta_swig.a: CMakeFiles/sta_swig.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/workspaces/power-estimation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library sta_swig.a"
	$(CMAKE_COMMAND) -P CMakeFiles/sta_swig.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sta_swig.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/sta_swig.dir/build: sta_swig.a

.PHONY : CMakeFiles/sta_swig.dir/build

CMakeFiles/sta_swig.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sta_swig.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sta_swig.dir/clean

CMakeFiles/sta_swig.dir/depend:
	cd /workspaces/power-estimation/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspaces/power-estimation/external/OpenSTA /workspaces/power-estimation/external/OpenSTA /workspaces/power-estimation/build /workspaces/power-estimation/build /workspaces/power-estimation/build/CMakeFiles/sta_swig.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sta_swig.dir/depend

