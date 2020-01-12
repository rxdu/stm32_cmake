# Target-specific flags
set(MCU_ARCH ARMCM3)
set(MCU_FAMILY STM32F103xB)
set(MCU_NAME STM32F103C8)

set(CPU "-mcpu=cortex-m3")
set(FPU "")
set(FLOAT_ABI "")

set(LINKER_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/${STM32_PROJ_FOLDER}/cubemx/STM32F103C8Tx_FLASH.ld)

option(USE_LL_LIB "Enable LL library" ON)
option(USE_HAL_LIB "Enable HAL library" OFF)

option(USE_SYSTEM_VIEW "Enable Segger SystemView library" OFF)