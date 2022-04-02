get_directory_property(_defs COMPILE_DEFINITIONS)
get_directory_property(_incs INCLUDE_DIRECTORIES)

list(TRANSFORM _defs PREPEND -D)
list(TRANSFORM _incs PREPEND -I)

add_custom_target(gen_linker_script
	COMMAND ${CMAKE_C_COMPILER} -E -D__ASSEMBLY__ -x assembler-with-cpp -P
	${_defs} ${_incs}
	${LINKER_SCRIPT} -o ${PROJECT_BINARY_DIR}/link.ld
	COMMAND_EXPAND_LISTS)
