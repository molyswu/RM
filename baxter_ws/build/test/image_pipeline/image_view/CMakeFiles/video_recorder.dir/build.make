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
CMAKE_SOURCE_DIR = /home/leroypc/baxter_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/leroypc/baxter_ws/build

# Include any dependencies generated for this target.
include test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/depend.make

# Include the progress variables for this target.
include test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/progress.make

# Include the compile flags for this target's objects.
include test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/flags.make

test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.o: test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/flags.make
test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.o: /home/leroypc/baxter_ws/src/test/image_pipeline/image_view/src/nodes/video_recorder.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/leroypc/baxter_ws/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.o"
	cd /home/leroypc/baxter_ws/build/test/image_pipeline/image_view && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.o -c /home/leroypc/baxter_ws/src/test/image_pipeline/image_view/src/nodes/video_recorder.cpp

test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.i"
	cd /home/leroypc/baxter_ws/build/test/image_pipeline/image_view && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/leroypc/baxter_ws/src/test/image_pipeline/image_view/src/nodes/video_recorder.cpp > CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.i

test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.s"
	cd /home/leroypc/baxter_ws/build/test/image_pipeline/image_view && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/leroypc/baxter_ws/src/test/image_pipeline/image_view/src/nodes/video_recorder.cpp -o CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.s

test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.o.requires:
.PHONY : test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.o.requires

test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.o.provides: test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.o.requires
	$(MAKE) -f test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/build.make test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.o.provides.build
.PHONY : test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.o.provides

test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.o.provides.build: test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.o

# Object files for target video_recorder
video_recorder_OBJECTS = \
"CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.o"

# External object files for target video_recorder
video_recorder_EXTERNAL_OBJECTS =

/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.o
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/build.make
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /opt/ros/indigo/lib/libcamera_calibration_parsers.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /home/leroypc/baxter_ws/devel/lib/libcv_bridge.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_core.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_imgproc.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_imgcodecs.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /opt/ros/indigo/lib/libdynamic_reconfigure_config_init_mutex.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /opt/ros/indigo/lib/libimage_transport.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /opt/ros/indigo/lib/libmessage_filters.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /opt/ros/indigo/lib/libnodeletlib.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /opt/ros/indigo/lib/libbondcpp.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/lib/x86_64-linux-gnu/libuuid.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /opt/ros/indigo/lib/libclass_loader.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/lib/libPocoFoundation.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/lib/x86_64-linux-gnu/libdl.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /opt/ros/indigo/lib/libroslib.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /opt/ros/indigo/lib/librospack.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/lib/x86_64-linux-gnu/libpython2.7.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/lib/x86_64-linux-gnu/libtinyxml.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /opt/ros/indigo/lib/libroscpp.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /opt/ros/indigo/lib/librosconsole.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /opt/ros/indigo/lib/librosconsole_log4cxx.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /opt/ros/indigo/lib/librosconsole_backend_interface.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/lib/liblog4cxx.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /opt/ros/indigo/lib/libxmlrpcpp.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /opt/ros/indigo/lib/libroscpp_serialization.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /opt/ros/indigo/lib/librostime.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /opt/ros/indigo/lib/libcpp_common.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_calib3d.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_core.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_dnn.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_features2d.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_flann.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_highgui.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_imgcodecs.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_imgproc.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_ml.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_objdetect.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_photo.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_shape.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_stitching.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_superres.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_video.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_videoio.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_videostab.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_viz.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_calib3d.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_features2d.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_flann.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_highgui.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_photo.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_video.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_videoio.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_imgcodecs.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_imgproc.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: /usr/local/lib/libopencv_core.so.3.3.0
/home/leroypc/baxter_ws/devel/lib/image_view/video_recorder: test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/leroypc/baxter_ws/devel/lib/image_view/video_recorder"
	cd /home/leroypc/baxter_ws/build/test/image_pipeline/image_view && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/video_recorder.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/build: /home/leroypc/baxter_ws/devel/lib/image_view/video_recorder
.PHONY : test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/build

test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/requires: test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/src/nodes/video_recorder.cpp.o.requires
.PHONY : test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/requires

test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/clean:
	cd /home/leroypc/baxter_ws/build/test/image_pipeline/image_view && $(CMAKE_COMMAND) -P CMakeFiles/video_recorder.dir/cmake_clean.cmake
.PHONY : test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/clean

test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/depend:
	cd /home/leroypc/baxter_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/leroypc/baxter_ws/src /home/leroypc/baxter_ws/src/test/image_pipeline/image_view /home/leroypc/baxter_ws/build /home/leroypc/baxter_ws/build/test/image_pipeline/image_view /home/leroypc/baxter_ws/build/test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/image_pipeline/image_view/CMakeFiles/video_recorder.dir/depend

