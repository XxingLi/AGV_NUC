# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kingyoung/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kingyoung/catkin_ws/build

# Include any dependencies generated for this target.
include serial_pkg/CMakeFiles/sendGoals.dir/depend.make

# Include the progress variables for this target.
include serial_pkg/CMakeFiles/sendGoals.dir/progress.make

# Include the compile flags for this target's objects.
include serial_pkg/CMakeFiles/sendGoals.dir/flags.make

serial_pkg/CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.o: serial_pkg/CMakeFiles/sendGoals.dir/flags.make
serial_pkg/CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.o: /home/kingyoung/catkin_ws/src/serial_pkg/src/simple_navigation_goals.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/kingyoung/catkin_ws/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object serial_pkg/CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.o"
	cd /home/kingyoung/catkin_ws/build/serial_pkg && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.o -c /home/kingyoung/catkin_ws/src/serial_pkg/src/simple_navigation_goals.cpp

serial_pkg/CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.i"
	cd /home/kingyoung/catkin_ws/build/serial_pkg && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/kingyoung/catkin_ws/src/serial_pkg/src/simple_navigation_goals.cpp > CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.i

serial_pkg/CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.s"
	cd /home/kingyoung/catkin_ws/build/serial_pkg && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/kingyoung/catkin_ws/src/serial_pkg/src/simple_navigation_goals.cpp -o CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.s

serial_pkg/CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.o.requires:
.PHONY : serial_pkg/CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.o.requires

serial_pkg/CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.o.provides: serial_pkg/CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.o.requires
	$(MAKE) -f serial_pkg/CMakeFiles/sendGoals.dir/build.make serial_pkg/CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.o.provides.build
.PHONY : serial_pkg/CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.o.provides

serial_pkg/CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.o.provides.build: serial_pkg/CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.o

# Object files for target sendGoals
sendGoals_OBJECTS = \
"CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.o"

# External object files for target sendGoals
sendGoals_EXTERNAL_OBJECTS =

/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: serial_pkg/CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.o
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: /opt/ros/hydro/lib/libroscpp.so
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: /usr/lib/libboost_signals-mt.so
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: /usr/lib/libboost_filesystem-mt.so
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: /opt/ros/hydro/lib/librosconsole.so
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: /opt/ros/hydro/lib/librosconsole_log4cxx.so
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: /opt/ros/hydro/lib/librosconsole_backend_interface.so
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: /usr/lib/liblog4cxx.so
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: /usr/lib/libboost_regex-mt.so
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: /opt/ros/hydro/lib/libxmlrpcpp.so
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: /opt/ros/hydro/lib/libroscpp_serialization.so
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: /opt/ros/hydro/lib/librostime.so
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: /usr/lib/libboost_date_time-mt.so
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: /usr/lib/libboost_system-mt.so
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: /usr/lib/libboost_thread-mt.so
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: /opt/ros/hydro/lib/libcpp_common.so
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: /opt/ros/hydro/lib/libconsole_bridge.so
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: serial_pkg/CMakeFiles/sendGoals.dir/build.make
/home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals: serial_pkg/CMakeFiles/sendGoals.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals"
	cd /home/kingyoung/catkin_ws/build/serial_pkg && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sendGoals.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
serial_pkg/CMakeFiles/sendGoals.dir/build: /home/kingyoung/catkin_ws/devel/lib/serial_pkg/sendGoals
.PHONY : serial_pkg/CMakeFiles/sendGoals.dir/build

serial_pkg/CMakeFiles/sendGoals.dir/requires: serial_pkg/CMakeFiles/sendGoals.dir/src/simple_navigation_goals.cpp.o.requires
.PHONY : serial_pkg/CMakeFiles/sendGoals.dir/requires

serial_pkg/CMakeFiles/sendGoals.dir/clean:
	cd /home/kingyoung/catkin_ws/build/serial_pkg && $(CMAKE_COMMAND) -P CMakeFiles/sendGoals.dir/cmake_clean.cmake
.PHONY : serial_pkg/CMakeFiles/sendGoals.dir/clean

serial_pkg/CMakeFiles/sendGoals.dir/depend:
	cd /home/kingyoung/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kingyoung/catkin_ws/src /home/kingyoung/catkin_ws/src/serial_pkg /home/kingyoung/catkin_ws/build /home/kingyoung/catkin_ws/build/serial_pkg /home/kingyoung/catkin_ws/build/serial_pkg/CMakeFiles/sendGoals.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : serial_pkg/CMakeFiles/sendGoals.dir/depend
