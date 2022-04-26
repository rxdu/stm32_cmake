# name of targets
set(BIN_TARGET ${PROJECT_NAME}.bin)
set(HEX_TARGET ${PROJECT_NAME}.hex)
set(MAP_TARGET ${PROJECT_NAME}.map)
set(LSS_TARGET ${PROJECT_NAME}.lss)

# flash
add_custom_target(jlink_flash 
    COMMAND JLinkExe -device ${MCU_NAME} -speed 4000 -if SWD -CommanderScript ${CMAKE_CURRENT_LIST_DIR}/jlink-flash-fw-standalone.jlink
)

# reset
add_custom_target(jlink_reset 
    COMMAND JLinkExe -device ${MCU_NAME} -speed 4000 -if SWD -CommanderScript ${CMAKE_SOURCE_DIR}/scripts/jlink-reset-stm32f4.jlink
)

# GDB
add_custom_target(jlink_gdb_server 
    COMMAND JLinkGDBServer -device ${MCU_NAME} -if SWD
)

add_custom_target(jlink_gdb_debug 
    COMMAND ${ARM_GDB_EXECUTABLE} -x ${CMAKE_SOURCE_DIR}/scripts/jlink-debug.gdbinit ${PROJECT_NAME}.elf
)

# # string should be less than 30 bytes
# release_binary:
# 	printf "westonrobot-$(shell git rev-parse --short HEAD)\r\n" | cat - $(PROG).bin > weston-scout-$(shell git rev-parse --short HEAD).bin