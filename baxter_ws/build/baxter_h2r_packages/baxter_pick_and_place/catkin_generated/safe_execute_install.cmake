execute_process(COMMAND "/home/leroypc/baxter_ws/build/baxter_h2r_packages/baxter_pick_and_place/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/leroypc/baxter_ws/build/baxter_h2r_packages/baxter_pick_and_place/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
