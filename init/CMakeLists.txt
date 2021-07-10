if(CONFIG_ARM64)
	set(LOCAL_SRCS
		${CMAKE_CURRENT_SOURCE_DIR}/arm64_start.S
		${CMAKE_CURRENT_SOURCE_DIR}/arm64_main.c)
endif()

if(CONFIG_RISCV)
	set(LOCAL_SRCS
		${CMAKE_CURRENT_SOURCE_DIR}/riscv_start.S
		${CMAKE_CURRENT_SOURCE_DIR}/riscv_main.c)
endif()

my_add_library(init
	SUPPORTED CONFIG_INIT

	${LOCAL_SRCS})
