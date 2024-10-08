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
include CMakeFiles/sta.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/sta.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sta.dir/flags.make

CMakeFiles/sta.dir/app/Main.cc.o: CMakeFiles/sta.dir/flags.make
CMakeFiles/sta.dir/app/Main.cc.o: /workspaces/power-estimation/external/OpenSTA/app/Main.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspaces/power-estimation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/sta.dir/app/Main.cc.o"
	/usr/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sta.dir/app/Main.cc.o -c /workspaces/power-estimation/external/OpenSTA/app/Main.cc

CMakeFiles/sta.dir/app/Main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sta.dir/app/Main.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/power-estimation/external/OpenSTA/app/Main.cc > CMakeFiles/sta.dir/app/Main.cc.i

CMakeFiles/sta.dir/app/Main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sta.dir/app/Main.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/power-estimation/external/OpenSTA/app/Main.cc -o CMakeFiles/sta.dir/app/Main.cc.s

# Object files for target sta
sta_OBJECTS = \
"CMakeFiles/sta.dir/app/Main.cc.o"

# External object files for target sta
sta_EXTERNAL_OBJECTS =

/workspaces/power-estimation/external/OpenSTA/app/sta: CMakeFiles/sta.dir/app/Main.cc.o
/workspaces/power-estimation/external/OpenSTA/app/sta: CMakeFiles/sta.dir/build.make
/workspaces/power-estimation/external/OpenSTA/app/sta: sta_swig.a
/workspaces/power-estimation/external/OpenSTA/app/sta: /workspaces/power-estimation/external/OpenSTA/app/libOpenSTA.a
/workspaces/power-estimation/external/OpenSTA/app/sta: /usr/lib/x86_64-linux-gnu/libtcl.so
/workspaces/power-estimation/external/OpenSTA/app/sta: /usr/local/lib/libcudd.a
/workspaces/power-estimation/external/OpenSTA/app/sta: /usr/lib/x86_64-linux-gnu/libz.so
/workspaces/power-estimation/external/OpenSTA/app/sta: CMakeFiles/sta.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/workspaces/power-estimation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /workspaces/power-estimation/external/OpenSTA/app/sta"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sta.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/sta.dir/build: /workspaces/power-estimation/external/OpenSTA/app/sta

.PHONY : CMakeFiles/sta.dir/build

CMakeFiles/sta.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sta.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sta.dir/clean

CMakeFiles/sta.dir/depend:
	cd /workspaces/power-estimation/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspaces/power-estimation/external/OpenSTA /workspaces/power-estimation/external/OpenSTA /workspaces/power-estimation/build /workspaces/power-estimation/build /workspaces/power-estimation/build/CMakeFiles/sta.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sta.dir/depend

