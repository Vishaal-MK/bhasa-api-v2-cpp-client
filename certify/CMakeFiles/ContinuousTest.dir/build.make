# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/vishaal/Desktop/VSCode/transcribe-client-cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/vishaal/Desktop/VSCode/transcribe-client-cpp

# Utility rule file for ContinuousTest.

# Include any custom commands dependencies for this target.
include certify/CMakeFiles/ContinuousTest.dir/compiler_depend.make

# Include the progress variables for this target.
include certify/CMakeFiles/ContinuousTest.dir/progress.make

certify/CMakeFiles/ContinuousTest:
	cd /home/vishaal/Desktop/VSCode/transcribe-client-cpp/certify && /usr/bin/ctest -D ContinuousTest

ContinuousTest: certify/CMakeFiles/ContinuousTest
ContinuousTest: certify/CMakeFiles/ContinuousTest.dir/build.make
.PHONY : ContinuousTest

# Rule to build all files generated by this target.
certify/CMakeFiles/ContinuousTest.dir/build: ContinuousTest
.PHONY : certify/CMakeFiles/ContinuousTest.dir/build

certify/CMakeFiles/ContinuousTest.dir/clean:
	cd /home/vishaal/Desktop/VSCode/transcribe-client-cpp/certify && $(CMAKE_COMMAND) -P CMakeFiles/ContinuousTest.dir/cmake_clean.cmake
.PHONY : certify/CMakeFiles/ContinuousTest.dir/clean

certify/CMakeFiles/ContinuousTest.dir/depend:
	cd /home/vishaal/Desktop/VSCode/transcribe-client-cpp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vishaal/Desktop/VSCode/transcribe-client-cpp /home/vishaal/Desktop/VSCode/transcribe-client-cpp/certify /home/vishaal/Desktop/VSCode/transcribe-client-cpp /home/vishaal/Desktop/VSCode/transcribe-client-cpp/certify /home/vishaal/Desktop/VSCode/transcribe-client-cpp/certify/CMakeFiles/ContinuousTest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : certify/CMakeFiles/ContinuousTest.dir/depend

