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

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

add_link_options(
	-nostdlib
	-T${CMAKE_CURRENT_SOURCE_DIR}/linker_scripts/${BOARD}_link.lds
)
