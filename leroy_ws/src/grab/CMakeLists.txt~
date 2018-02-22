cmake_minimum_required(VERSION 2.8)
project(DisplayImage)
find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS}  ${OPENNI2_LIB_DIR} ${OPENNI2_INCLUDE_DIR} )
include_directories ("/usr/include/ni/"  "/home/leroypc/OpenNI2/Include" )

add_executable(save save.cpp)
target_link_libraries( save OpenNI ${OpenCV_LIBS})