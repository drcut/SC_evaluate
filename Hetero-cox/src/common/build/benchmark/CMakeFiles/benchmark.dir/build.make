# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/robinhan/miniconda3/bin/cmake

# The command to remove a file.
RM = /home/robinhan/miniconda3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common/build

# Include any dependencies generated for this target.
include benchmark/CMakeFiles/benchmark.dir/depend.make

# Include the progress variables for this target.
include benchmark/CMakeFiles/benchmark.dir/progress.make

# Include the compile flags for this target's objects.
include benchmark/CMakeFiles/benchmark.dir/flags.make

benchmark/CMakeFiles/benchmark.dir/benchmark_runner.o: benchmark/CMakeFiles/benchmark.dir/flags.make
benchmark/CMakeFiles/benchmark.dir/benchmark_runner.o: ../benchmark/benchmark_runner.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object benchmark/CMakeFiles/benchmark.dir/benchmark_runner.o"
	cd /home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common/build/benchmark && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/benchmark.dir/benchmark_runner.o -c /home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common/benchmark/benchmark_runner.cc

benchmark/CMakeFiles/benchmark.dir/benchmark_runner.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/benchmark.dir/benchmark_runner.i"
	cd /home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common/build/benchmark && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common/benchmark/benchmark_runner.cc > CMakeFiles/benchmark.dir/benchmark_runner.i

benchmark/CMakeFiles/benchmark.dir/benchmark_runner.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/benchmark.dir/benchmark_runner.s"
	cd /home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common/build/benchmark && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common/benchmark/benchmark_runner.cc -o CMakeFiles/benchmark.dir/benchmark_runner.s

# Object files for target benchmark
benchmark_OBJECTS = \
"CMakeFiles/benchmark.dir/benchmark_runner.o"

# External object files for target benchmark
benchmark_EXTERNAL_OBJECTS =

benchmark/libbenchmark.a: benchmark/CMakeFiles/benchmark.dir/benchmark_runner.o
benchmark/libbenchmark.a: benchmark/CMakeFiles/benchmark.dir/build.make
benchmark/libbenchmark.a: benchmark/CMakeFiles/benchmark.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libbenchmark.a"
	cd /home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common/build/benchmark && $(CMAKE_COMMAND) -P CMakeFiles/benchmark.dir/cmake_clean_target.cmake
	cd /home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common/build/benchmark && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/benchmark.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
benchmark/CMakeFiles/benchmark.dir/build: benchmark/libbenchmark.a

.PHONY : benchmark/CMakeFiles/benchmark.dir/build

benchmark/CMakeFiles/benchmark.dir/clean:
	cd /home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common/build/benchmark && $(CMAKE_COMMAND) -P CMakeFiles/benchmark.dir/cmake_clean.cmake
.PHONY : benchmark/CMakeFiles/benchmark.dir/clean

benchmark/CMakeFiles/benchmark.dir/depend:
	cd /home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common /home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common/benchmark /home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common/build /home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common/build/benchmark /home/robinhan/repo/Hetero-Mark-dpct-dpcpp/src/common/build/benchmark/CMakeFiles/benchmark.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : benchmark/CMakeFiles/benchmark.dir/depend
