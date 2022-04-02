cmake_minimum_required(VERSION 3.16.5 FATAL_ERROR)

project(${PROJECT_NAME} LANGUAGES C ASM)

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR)
  message(FATAL_ERROR "requires an out-of-source build!")
endif()

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake
                      ${CMAKE_CURRENT_SOURCE_DIR}/cmake/board)

include(cfg)
include(kconfig)
include(module)
include(compile_options)
include(gen_linker_script)

add_executable(${PROJECT_NAME} ${CMAKE_CURRENT_SOURCE_DIR}/empty.c)
add_dependencies(${PROJECT_NAME} gen_linker_script)

set(CMAKE_VERBOSE_MAKEFILE ON)

add_subdirectory(init)

add_custom_command(
	TARGET ${PROJECT_NAME}
	POST_BUILD
	COMMAND ${OBJCOPY} ${PROJECT_NAME} -S ${PROJECT_NAME}.bin
	WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
	COMMAND_EXPAND_LISTS
)

include(${BOARD}_build OPTIONAL)
