# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(tags_detection_CONFIG_INCLUDED)
  return()
endif()
set(tags_detection_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("TRUE" STREQUAL "TRUE")
  set(tags_detection_SOURCE_PREFIX /home/leory/shit_ws/src/tags_detection)
  set(tags_detection_DEVEL_PREFIX /home/leory/shit_ws/devel)
  set(tags_detection_INSTALL_PREFIX "")
  set(tags_detection_PREFIX ${tags_detection_DEVEL_PREFIX})
else()
  set(tags_detection_SOURCE_PREFIX "")
  set(tags_detection_DEVEL_PREFIX "")
  set(tags_detection_INSTALL_PREFIX /home/leory/shit_ws/install)
  set(tags_detection_PREFIX ${tags_detection_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'tags_detection' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(tags_detection_FOUND_CATKIN_PROJECT TRUE)

if(NOT " " STREQUAL " ")
  set(tags_detection_INCLUDE_DIRS "")
  set(_include_dirs "")
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${tags_detection_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'tags_detection' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  Ask the maintainer 'leory <leory@todo.todo>' to fix it.")
      endif()
    else()
      message(FATAL_ERROR "Project 'tags_detection' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/home/leory/shit_ws/src/tags_detection/${idir}'.  Ask the maintainer 'leory <leory@todo.todo>' to fix it.")
    endif()
    _list_append_unique(tags_detection_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND tags_detection_LIBRARIES ${library})
  elseif(TARGET ${library})
    list(APPEND tags_detection_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND tags_detection_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/leory/shit_ws/devel/lib;/home/leory/shit_ws/devel/lib;/opt/ros/kinetic/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(tags_detection_LIBRARY_DIRS ${lib_path})
      list(APPEND tags_detection_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'tags_detection'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND tags_detection_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(tags_detection_EXPORTED_TARGETS "tags_detection_generate_messages_cpp;tags_detection_generate_messages_eus;tags_detection_generate_messages_lisp;tags_detection_generate_messages_nodejs;tags_detection_generate_messages_py")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${tags_detection_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 tags_detection_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${tags_detection_dep}_FOUND)
      find_package(${tags_detection_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${tags_detection_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(tags_detection_INCLUDE_DIRS ${${tags_detection_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(tags_detection_LIBRARIES ${tags_detection_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${tags_detection_dep}_LIBRARIES})
  _list_append_deduplicate(tags_detection_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(tags_detection_LIBRARIES ${tags_detection_LIBRARIES})

  _list_append_unique(tags_detection_LIBRARY_DIRS ${${tags_detection_dep}_LIBRARY_DIRS})
  list(APPEND tags_detection_EXPORTED_TARGETS ${${tags_detection_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "tags_detection-msg-extras.cmake")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${tags_detection_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
