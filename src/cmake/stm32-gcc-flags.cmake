
# generate flags from user variables
if(CMAKE_BUILD_TYPE MATCHES Debug)
set(DBG_FLAGS "-g3 -gdwarf-2 -O0")
elseif(CMAKE_BUILD_TYPE MATCHES Release)
set(DBG_FLAGS "-O0")
endif()

# stm32 gcc common flags
message(STATUS "MCU_FLAGS: ${MCU_FLAGS}")
message(STATUS "DBG_FLAGS: ${DBG_FLAGS}")

# compiler: language specific flags
set(CMAKE_C_FLAGS "${MCU_FLAGS} -std=gnu99 -Wall -fdata-sections -ffunction-sections ${DBG_FLAGS} " CACHE INTERNAL "C compiler flags")
set(CMAKE_C_FLAGS_DEBUG "" CACHE INTERNAL "C compiler flags: Debug")
set(CMAKE_C_FLAGS_RELEASE "" CACHE INTERNAL "C compiler flags: Release")

set(CMAKE_CXX_FLAGS "${MCU_FLAGS} -fno-rtti -fno-exceptions -fno-builtin -Wall -fdata-sections -ffunction-sections ${DBG_FLAGS} " CACHE INTERNAL "Cxx compiler flags")
set(CMAKE_CXX_FLAGS_DEBUG "" CACHE INTERNAL "Cxx compiler flags: Debug")
set(CMAKE_CXX_FLAGS_RELEASE "" CACHE INTERNAL "Cxx compiler flags: Release")

set(CMAKE_ASM_FLAGS "${MCU_FLAGS} -x assembler-with-cpp ${DBG_FLAGS} " CACHE INTERNAL "ASM compiler flags")
set(CMAKE_ASM_FLAGS_DEBUG "" CACHE INTERNAL "ASM compiler flags: Debug")
set(CMAKE_ASM_FLAGS_RELEASE "" CACHE INTERNAL "ASM compiler flags: Release")

set(CMAKE_EXE_LINKER_FLAGS "${LINK_FLAGS}" CACHE INTERNAL "Exe linker flags")
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "" CACHE INTERNAL "Shared linker flags")