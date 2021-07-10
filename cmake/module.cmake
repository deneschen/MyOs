function(my_add_library name)
	cmake_parse_arguments(
		ARG                                               # prefix
		""                                                # options
		"SUPPORTED"                                       # one_value_keywords
		"COMPILE_DEFS;COMPILE_OPTS;INCLUDE_DIRS;DEPENDS"  # multi_value_keywords
		${ARGN}
	)

	if(NOT ${${ARG_SUPPORTED}})
		return()
	endif()

	message("name ${name}")
	message("ARG_COMPILE_DEFS ${ARG_COMPILE_DEFS}")
	message("ARG_COMPILE_OPTS ${ARG_COMPILE_OPTS}")
	message("ARG_INCLUDE_DIRS ${ARG_INCLUDE_DIRS}")
	message("ARG_UNPARSED_ARGUMENTS ${ARG_UNPARSED_ARGUMENTS}")
	message("ARG_DEPENDS ${ARG_DEPENDS}")

	add_library(${name} STATIC)
	target_sources(${name} PRIVATE ${ARG_UNPARSED_ARGUMENTS})
	target_compile_definitions(${name} PRIVATE ${ARG_COMPILE_DEFS})
	target_compile_options(${name}     PRIVATE ${ARG_COMPILE_OPTS})
	target_include_directories(${name} PRIVATE ${ARG_INCLUDE_DIRS})
	target_link_libraries(${PROJECT_NAME} ${name})
	if(ARG_DEPENDS)
		add_dependencies(${name} ${ARG_DEPENDS})
	endif()
endfunction()

function(my_get_all_library all_libs)
	get_target_property(OUT builtin LINK_LIBRARIES)
	message(FATAL_ERROR "chenjun debug ${OUT}")
	get_property(target_type TARGET ${dir_target} PROPERTY TYPE)
endfunction()