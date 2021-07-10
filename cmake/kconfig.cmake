if(NOT KCONFIG_ROOT)
	set(KCONFIG_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/Kconfig)
endif()

set(BOARD_DEFCONFIG   ${CMAKE_CURRENT_SOURCE_DIR}/configs/${BOARD}_defconfig)
set(DOTCONFIG         ${PROJECT_BINARY_DIR}/.config)
set(KCONFIG_ENV_LIST  ${PROJECT_BINARY_DIR}/env_list.txt)
set(KCONFIG_FILE_LIST ${PROJECT_BINARY_DIR}/file_list.txt)
set(AUTOCONF_H        ${PROJECT_BINARY_DIR}/autoconf.h)

#
# import_kconfig(<prefix> <kconfig_fragment> [<keys>])
#
# Parse a KConfig fragment (typically with extension .config) and
# introduce all the symbols that are prefixed with 'prefix' into the
# CMake namespace. List all created variable names in the 'keys'
# output variable if present.
function(import_kconfig prefix kconfig_fragment)
	# Parse the lines prefixed with 'prefix' in ${kconfig_fragment}
	file(
		STRINGS
		${kconfig_fragment}
		DOT_CONFIG_LIST
		REGEX "^${prefix}"
		ENCODING "UTF-8"
	)

	foreach (CONFIG ${DOT_CONFIG_LIST})
		# CONFIG could look like: CONFIG_NET_BUF=y

		# Match the first part, the variable name
		string(REGEX MATCH "[^=]+" CONF_VARIABLE_NAME ${CONFIG})

		# Match the second part, variable value
		string(REGEX MATCH "=(.+$)" CONF_VARIABLE_VALUE ${CONFIG})
		# The variable name match we just did included the '=' symbol. To just get the
		# part on the RHS we use match group 1
		set(CONF_VARIABLE_VALUE ${CMAKE_MATCH_1})

		if("${CONF_VARIABLE_VALUE}" MATCHES "^\"(.*)\"$") # Is surrounded by quotes
			set(CONF_VARIABLE_VALUE ${CMAKE_MATCH_1})
		endif()

		set("${CONF_VARIABLE_NAME}" "${CONF_VARIABLE_VALUE}" PARENT_SCOPE)
	endforeach()
endfunction()

add_custom_target(
	menuconfig
	COMMAND cp ${BOARD_DEFCONFIG} ${DOTCONFIG}
	COMMAND ${CMAKE_COMMAND} -E env
	srctree=${CMAKE_CURRENT_SOURCE_DIR}
	KCONFIG_CONFIG=${DOTCONFIG}
	python3 -B ${CMAKE_CURRENT_SOURCE_DIR}/cmake/scripts/kconfig/menuconfig.py
	${KCONFIG_ROOT}
	COMMAND cp ${DOTCONFIG} ${BOARD_DEFCONFIG}
	WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
	USES_TERMINAL
	COMMAND_EXPAND_LISTS
)

execute_process(
	COMMAND ${CMAKE_COMMAND} -E env
	srctree=${CMAKE_CURRENT_SOURCE_DIR}
	KCONFIG_CONFIG=${BOARD_DEFCONFIG}
	python3 -B
	${CMAKE_CURRENT_SOURCE_DIR}/cmake/scripts/kconfig/genconfig.py
	--header-path ${AUTOCONF_H}
	--config-out ${DOTCONFIG}
	--file-list ${KCONFIG_FILE_LIST}
	--env-list ${KCONFIG_ENV_LIST}
		${KCONFIG_ROOT}
	WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
	RESULT_VARIABLE ret
)
if(NOT "${ret}" STREQUAL "0")
	message(FATAL_ERROR "genconfig failed with return code: ${ret}")
endif()

# Parse the lines prefixed with CONFIG_ in the .config file from Kconfig
import_kconfig(CONFIG_ ${DOTCONFIG})