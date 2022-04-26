# name of targets
set(BIN_TARGET ${PROJECT_NAME}.bin)
set(HEX_TARGET ${PROJECT_NAME}.hex)
set(MAP_TARGET ${PROJECT_NAME}.map)
set(LSS_TARGET ${PROJECT_NAME}.lss)

# flash
add_custom_target(jlink_flash 
    DEPENDS ${ELF_TARGET} 
    COMMAND JLinkExe -device ${MCU_NAME} -speed 4000 -if SWD -CommanderScript ${CMAKE_CURRENT_SOURCE_DIR}/jlink/jlink-flash-fw-standalone.jlink
)

add_custom_target(jlink_bootflash
    DEPENDS ${ELF_TARGET} 
    COMMAND JLinkExe -device ${MCU_NAME} -speed 4000 -if SWD -CommanderScript ${CMAKE_CURRENT_SOURCE_DIR}/jlink/jlink-flash-fw-bootloader.jlink
)

execute_process(COMMAND git rev-parse --short HEAD OUTPUT_VARIABLE GIT_COMMIT_SHORT_STR OUTPUT_STRIP_TRAILING_WHITESPACE)
set(RELEASE_BIN_NAME "weston-scout-${GIT_COMMIT_SHORT_STR}")
message(STATUS "Release binary name: ${RELEASE_BIN_NAME}")
add_custom_target(release_binary
    DEPENDS ${ELF_TARGET} 
    COMMAND cp scoutfw.bin ${RELEASE_BIN_NAME}.bin
)

# reset
add_custom_target(jlink_reset 
    COMMAND JLinkExe -device ${MCU_NAME} -speed 4000 -if SWD -CommanderScript ${CMAKE_SOURCE_DIR}/scripts/jlink-reset-stm32f4.jlink
)

# GDB
add_custom_target(jlink_gdb_server 
    DEPENDS ${ELF_TARGET} 
    COMMAND JLinkGDBServer -device $(MCU_NAME) -if SWD
)

add_custom_target(jlink_gdb_debug 
    DEPENDS ${ELF_TARGET} 
    COMMAND ${ARM_GDB_EXECUTABLE} -x ${CMAKE_SOURCE_DIR}/scripts/jlink-debug.gdbinit $(PROG).elf
)

# # string should be less than 30 bytes
# release_binary:
# 	printf "westonrobot-$(shell git rev-parse --short HEAD)\r\n" | cat - $(PROG).bin > weston-scout-$(shell git rev-parse --short HEAD).bin