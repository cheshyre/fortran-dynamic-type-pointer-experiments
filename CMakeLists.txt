cmake_minimum_required(VERSION 3.10)

# Determine if FDTPE is built as a subproject (using add_subdirectory)
# or if it is the main project.
if(NOT DEFINED FDTPE_MAIN_PROJECT)
  set(FDTPE_MAIN_PROJECT OFF)
  if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR)
    set(FDTPE_MAIN_PROJECT ON)
    message(STATUS "CMake version: ${CMAKE_VERSION}")
  endif()
endif()

# Set the default CMAKE_BUILD_TYPE to Release.
# This should be done before the project command since the latter can set
# CMAKE_BUILD_TYPE itself (it does so for nmake).
if(FDTPE_MAIN_PROJECT AND NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

if(FDTPE_MAIN_PROJECT)
  add_compile_options("-Wall" "-Wextra" "$<$<CONFIG:RELEASE>:-O3>")
endif()

project(FORTRAN_DYNAMIC_TYPE_POINTER_EXPERIMENTS VERSION 0.1.0)

enable_language(Fortran)

add_subdirectory(basic)
add_subdirectory(advanced)
