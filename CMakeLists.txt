cmake_minimum_required(VERSION 3.16.5 FATAL_ERROR)

project(${PROJECT_NAME} LANGUAGES C ASM)

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR)
  message(FATAL_ERROR "requires an out-of-source build!")
endif()

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

include(kconfig)
include(module)
include(compile_options)

add_executable(${PROJECT_NAME} ${CMAKE_CURRENT_SOURCE_DIR}/empty.c)

set(CMAKE_VERBOSE_MAKEFILE ON)

add_subdirectory(init)

include(${BOARD}_build OPTIONAL)
