# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "baxter_grasps_server: 0 messages, 1 services")

set(MSG_I_FLAGS "-Imoveit_msgs:/opt/ros/indigo/share/moveit_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/indigo/share/actionlib_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Itrajectory_msgs:/opt/ros/indigo/share/trajectory_msgs/cmake/../msg;-Ishape_msgs:/opt/ros/indigo/share/shape_msgs/cmake/../msg;-Iobject_recognition_msgs:/opt/ros/indigo/share/object_recognition_msgs/cmake/../msg;-Ioctomap_msgs:/opt/ros/indigo/share/octomap_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(baxter_grasps_server_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/leroypc/baxter_ws/src/baxter_h2r_packages/baxter_grasps_server/srv/GraspService.srv" NAME_WE)
add_custom_target(_baxter_grasps_server_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "baxter_grasps_server" "/home/leroypc/baxter_ws/src/baxter_h2r_packages/baxter_grasps_server/srv/GraspService.srv" "geometry_msgs/Vector3Stamped:moveit_msgs/Grasp:geometry_msgs/Point:geometry_msgs/Quaternion:trajectory_msgs/JointTrajectory:geometry_msgs/Vector3:std_msgs/Header:geometry_msgs/Pose:geometry_msgs/PoseStamped:moveit_msgs/GripperTranslation:trajectory_msgs/JointTrajectoryPoint"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(baxter_grasps_server
  "/home/leroypc/baxter_ws/src/baxter_h2r_packages/baxter_grasps_server/srv/GraspService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3Stamped.msg;/opt/ros/indigo/share/moveit_msgs/cmake/../msg/Grasp.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/moveit_msgs/cmake/../msg/GripperTranslation.msg;/opt/ros/indigo/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_grasps_server
)

### Generating Module File
_generate_module_cpp(baxter_grasps_server
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_grasps_server
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(baxter_grasps_server_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(baxter_grasps_server_generate_messages baxter_grasps_server_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/leroypc/baxter_ws/src/baxter_h2r_packages/baxter_grasps_server/srv/GraspService.srv" NAME_WE)
add_dependencies(baxter_grasps_server_generate_messages_cpp _baxter_grasps_server_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(baxter_grasps_server_gencpp)
add_dependencies(baxter_grasps_server_gencpp baxter_grasps_server_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baxter_grasps_server_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(baxter_grasps_server
  "/home/leroypc/baxter_ws/src/baxter_h2r_packages/baxter_grasps_server/srv/GraspService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3Stamped.msg;/opt/ros/indigo/share/moveit_msgs/cmake/../msg/Grasp.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/moveit_msgs/cmake/../msg/GripperTranslation.msg;/opt/ros/indigo/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_grasps_server
)

### Generating Module File
_generate_module_lisp(baxter_grasps_server
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_grasps_server
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(baxter_grasps_server_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(baxter_grasps_server_generate_messages baxter_grasps_server_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/leroypc/baxter_ws/src/baxter_h2r_packages/baxter_grasps_server/srv/GraspService.srv" NAME_WE)
add_dependencies(baxter_grasps_server_generate_messages_lisp _baxter_grasps_server_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(baxter_grasps_server_genlisp)
add_dependencies(baxter_grasps_server_genlisp baxter_grasps_server_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baxter_grasps_server_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(baxter_grasps_server
  "/home/leroypc/baxter_ws/src/baxter_h2r_packages/baxter_grasps_server/srv/GraspService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3Stamped.msg;/opt/ros/indigo/share/moveit_msgs/cmake/../msg/Grasp.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/moveit_msgs/cmake/../msg/GripperTranslation.msg;/opt/ros/indigo/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_grasps_server
)

### Generating Module File
_generate_module_py(baxter_grasps_server
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_grasps_server
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(baxter_grasps_server_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(baxter_grasps_server_generate_messages baxter_grasps_server_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/leroypc/baxter_ws/src/baxter_h2r_packages/baxter_grasps_server/srv/GraspService.srv" NAME_WE)
add_dependencies(baxter_grasps_server_generate_messages_py _baxter_grasps_server_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(baxter_grasps_server_genpy)
add_dependencies(baxter_grasps_server_genpy baxter_grasps_server_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baxter_grasps_server_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_grasps_server)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_grasps_server
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET moveit_msgs_generate_messages_cpp)
  add_dependencies(baxter_grasps_server_generate_messages_cpp moveit_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_grasps_server)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_grasps_server
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET moveit_msgs_generate_messages_lisp)
  add_dependencies(baxter_grasps_server_generate_messages_lisp moveit_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_grasps_server)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_grasps_server\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_grasps_server
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_grasps_server
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_grasps_server/.+/__init__.pyc?$"
  )
endif()
if(TARGET moveit_msgs_generate_messages_py)
  add_dependencies(baxter_grasps_server_generate_messages_py moveit_msgs_generate_messages_py)
endif()
