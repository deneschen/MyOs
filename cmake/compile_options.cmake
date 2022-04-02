add_compile_options(
	-Wall
	-Werror
	-O0
	-g
	-ffreestanding)

if(CONFIG_ARM64)
	add_compile_options(
		-march=armv8-a
		-mgeneral-regs-only
	)
endif()

set(CMAKE_ASM_FLAGS "-D__ASSEMBLY__ -x assembler-with-cpp")

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

add_link_options(
	-nostdlib
	-T${PROJECT_BINARY_DIR}/link.ld
)
