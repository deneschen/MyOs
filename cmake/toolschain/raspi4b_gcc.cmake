set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR riscv)

set(CROSS_COMPILE "aarch64-none-linux-gnu-")
set(CMAKE_C_COMPILER   ${CROSS_COMPILE}gcc)
set(CMAKE_ASM_COMPILER ${CROSS_COMPILE}gcc)
set(CMAKE_AR           ${CROSS_COMPILE}ar)
set(CMAKE_LINKER       ${CROSS_COMPILE}ld)
set(OBJCOPY            ${CROSS_COMPILE}objcopy)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_ASM_OUTPUT_EXTENSION ".o")
set(CMAKE_ASM_OUTPUT_EXTENSION_REPLACE 1)
set(CMAKE_C_OUTPUT_EXTENSION ".o")
set(CMAKE_C_OUTPUT_EXTENSION_REPLACE 1)

set(CMAKE_ASM_SOURCE_FILE_EXTENSIONS S;s;)

set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <FLAGS> <LINK_FLAGS> <OBJECTS> <LINK_LIBRARIES> -o <TARGET>")
set(CMAKE_ASM_COMPILE_OBJECT "<CMAKE_ASM_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -x assembler-with-cpp -c -o <OBJECT> <SOURCE>")
set(CMAKE_ASM_CREATE_STATIC_LIBRARY "<CMAKE_AR> -crD <TARGET> <LINK_FLAGS> <OBJECTS>")
set(CMAKE_C_COMPILE_OBJECT "<CMAKE_C_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -o <OBJECT> -c <SOURCE>")
set(CMAKE_C_CREATE_STATIC_LIBRARY "<CMAKE_AR> -crD <TARGET> <LINK_FLAGS> <OBJECTS>")
