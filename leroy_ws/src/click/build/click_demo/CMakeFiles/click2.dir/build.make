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

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/leroypc/click/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/leroypc/click/build

# Include any dependencies generated for this target.
include click_demo/CMakeFiles/click2.dir/depend.make

# Include the progress variables for this target.
include click_demo/CMakeFiles/click2.dir/progress.make

# Include the compile flags for this target's objects.
include click_demo/CMakeFiles/click2.dir/flags.make

click_demo/CMakeFiles/click2.dir/src/click.cpp.o: click_demo/CMakeFiles/click2.dir/flags.make
click_demo/CMakeFiles/click2.dir/src/click.cpp.o: /home/leroypc/click/src/click_demo/src/click.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/leroypc/click/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object click_demo/CMakeFiles/click2.dir/src/click.cpp.o"
	cd /home/leroypc/click/build/click_demo && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/click2.dir/src/click.cpp.o -c /home/leroypc/click/src/click_demo/src/click.cpp

click_demo/CMakeFiles/click2.dir/src/click.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/click2.dir/src/click.cpp.i"
	cd /home/leroypc/click/build/click_demo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/leroypc/click/src/click_demo/src/click.cpp > CMakeFiles/click2.dir/src/click.cpp.i

click_demo/CMakeFiles/click2.dir/src/click.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/click2.dir/src/click.cpp.s"
	cd /home/leroypc/click/build/click_demo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/leroypc/click/src/click_demo/src/click.cpp -o CMakeFiles/click2.dir/src/click.cpp.s

click_demo/CMakeFiles/click2.dir/src/click.cpp.o.requires:
.PHONY : click_demo/CMakeFiles/click2.dir/src/click.cpp.o.requires

click_demo/CMakeFiles/click2.dir/src/click.cpp.o.provides: click_demo/CMakeFiles/click2.dir/src/click.cpp.o.requires
	$(MAKE) -f click_demo/CMakeFiles/click2.dir/build.make click_demo/CMakeFiles/click2.dir/src/click.cpp.o.provides.build
.PHONY : click_demo/CMakeFiles/click2.dir/src/click.cpp.o.provides

click_demo/CMakeFiles/click2.dir/src/click.cpp.o.provides.build: click_demo/CMakeFiles/click2.dir/src/click.cpp.o

# Object files for target click2
click2_OBJECTS = \
"CMakeFiles/click2.dir/src/click.cpp.o"

# External object files for target click2
click2_EXTERNAL_OBJECTS =

click_demo/click2: click_demo/CMakeFiles/click2.dir/src/click.cpp.o
click_demo/click2: click_demo/CMakeFiles/click2.dir/build.make
click_demo/click2: /usr/local/lib/libopencv_calib3d.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_core.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_dnn.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_features2d.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_flann.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_highgui.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_imgcodecs.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_imgproc.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_ml.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_objdetect.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_photo.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_shape.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_stitching.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_superres.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_video.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_videoio.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_videostab.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_viz.so.3.3.0
click_demo/click2: /opt/ros/indigo/lib/libroscpp.so
click_demo/click2: /usr/lib/x86_64-linux-gnu/libboost_signals.so
click_demo/click2: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
click_demo/click2: /opt/ros/indigo/lib/librosconsole.so
click_demo/click2: /opt/ros/indigo/lib/librosconsole_log4cxx.so
click_demo/click2: /opt/ros/indigo/lib/librosconsole_backend_interface.so
click_demo/click2: /usr/lib/liblog4cxx.so
click_demo/click2: /usr/lib/x86_64-linux-gnu/libboost_regex.so
click_demo/click2: /opt/ros/indigo/lib/libxmlrpcpp.so
click_demo/click2: /opt/ros/indigo/lib/libroscpp_serialization.so
click_demo/click2: /opt/ros/indigo/lib/librostime.so
click_demo/click2: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
click_demo/click2: /opt/ros/indigo/lib/libcpp_common.so
click_demo/click2: /usr/lib/x86_64-linux-gnu/libboost_system.so
click_demo/click2: /usr/lib/x86_64-linux-gnu/libboost_thread.so
click_demo/click2: /usr/lib/x86_64-linux-gnu/libpthread.so
click_demo/click2: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
click_demo/click2: /usr/local/lib/libopencv_calib3d.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_features2d.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_flann.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_highgui.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_photo.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_video.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_videoio.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_imgcodecs.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_imgproc.so.3.3.0
click_demo/click2: /usr/local/lib/libopencv_core.so.3.3.0
click_demo/click2: click_demo/CMakeFiles/click2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable click2"
	cd /home/leroypc/click/build/click_demo && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/click2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
click_demo/CMakeFiles/click2.dir/build: click_demo/click2
.PHONY : click_demo/CMakeFiles/click2.dir/build

click_demo/CMakeFiles/click2.dir/requires: click_demo/CMakeFiles/click2.dir/src/click.cpp.o.requires
.PHONY : click_demo/CMakeFiles/click2.dir/requires

click_demo/CMakeFiles/click2.dir/clean:
	cd /home/leroypc/click/build/click_demo && $(CMAKE_COMMAND) -P CMakeFiles/click2.dir/cmake_clean.cmake
.PHONY : click_demo/CMakeFiles/click2.dir/clean

click_demo/CMakeFiles/click2.dir/depend:
	cd /home/leroypc/click/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/leroypc/click/src /home/leroypc/click/src/click_demo /home/leroypc/click/build /home/leroypc/click/build/click_demo /home/leroypc/click/build/click_demo/CMakeFiles/click2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : click_demo/CMakeFiles/click2.dir/depend

