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
CMAKE_SOURCE_DIR = /home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client

# Include any dependencies generated for this target.
include certify/tests/CMakeFiles/https_verification_fail.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include certify/tests/CMakeFiles/https_verification_fail.dir/compiler_depend.make

# Include the progress variables for this target.
include certify/tests/CMakeFiles/https_verification_fail.dir/progress.make

# Include the compile flags for this target's objects.
include certify/tests/CMakeFiles/https_verification_fail.dir/flags.make

certify/tests/CMakeFiles/https_verification_fail.dir/https_verification_fail.cpp.o: certify/tests/CMakeFiles/https_verification_fail.dir/flags.make
certify/tests/CMakeFiles/https_verification_fail.dir/https_verification_fail.cpp.o: certify/tests/https_verification_fail.cpp
certify/tests/CMakeFiles/https_verification_fail.dir/https_verification_fail.cpp.o: certify/tests/CMakeFiles/https_verification_fail.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object certify/tests/CMakeFiles/https_verification_fail.dir/https_verification_fail.cpp.o"
	cd /home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client/certify/tests && /bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT certify/tests/CMakeFiles/https_verification_fail.dir/https_verification_fail.cpp.o -MF CMakeFiles/https_verification_fail.dir/https_verification_fail.cpp.o.d -o CMakeFiles/https_verification_fail.dir/https_verification_fail.cpp.o -c /home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client/certify/tests/https_verification_fail.cpp

certify/tests/CMakeFiles/https_verification_fail.dir/https_verification_fail.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/https_verification_fail.dir/https_verification_fail.cpp.i"
	cd /home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client/certify/tests && /bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client/certify/tests/https_verification_fail.cpp > CMakeFiles/https_verification_fail.dir/https_verification_fail.cpp.i

certify/tests/CMakeFiles/https_verification_fail.dir/https_verification_fail.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/https_verification_fail.dir/https_verification_fail.cpp.s"
	cd /home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client/certify/tests && /bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client/certify/tests/https_verification_fail.cpp -o CMakeFiles/https_verification_fail.dir/https_verification_fail.cpp.s

# Object files for target https_verification_fail
https_verification_fail_OBJECTS = \
"CMakeFiles/https_verification_fail.dir/https_verification_fail.cpp.o"

# External object files for target https_verification_fail
https_verification_fail_EXTERNAL_OBJECTS =

certify/tests/https_verification_fail: certify/tests/CMakeFiles/https_verification_fail.dir/https_verification_fail.cpp.o
certify/tests/https_verification_fail: certify/tests/CMakeFiles/https_verification_fail.dir/build.make
certify/tests/https_verification_fail: /usr/lib/libboost_system.so.1.80.0
certify/tests/https_verification_fail: /usr/lib/libboost_filesystem.so.1.80.0
certify/tests/https_verification_fail: /usr/lib/libboost_atomic.so.1.80.0
certify/tests/https_verification_fail: /usr/lib/libboost_date_time.so.1.80.0
certify/tests/https_verification_fail: /usr/local/lib/libssl.so
certify/tests/https_verification_fail: /usr/local/lib/libcrypto.so
certify/tests/https_verification_fail: certify/tests/CMakeFiles/https_verification_fail.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable https_verification_fail"
	cd /home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client/certify/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/https_verification_fail.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
certify/tests/CMakeFiles/https_verification_fail.dir/build: certify/tests/https_verification_fail
.PHONY : certify/tests/CMakeFiles/https_verification_fail.dir/build

certify/tests/CMakeFiles/https_verification_fail.dir/clean:
	cd /home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client/certify/tests && $(CMAKE_COMMAND) -P CMakeFiles/https_verification_fail.dir/cmake_clean.cmake
.PHONY : certify/tests/CMakeFiles/https_verification_fail.dir/clean

certify/tests/CMakeFiles/https_verification_fail.dir/depend:
	cd /home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client /home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client/certify/tests /home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client /home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client/certify/tests /home/vishaal/Desktop/VSCode/bhasa-api-v2-cpp-client/certify/tests/CMakeFiles/https_verification_fail.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : certify/tests/CMakeFiles/https_verification_fail.dir/depend

