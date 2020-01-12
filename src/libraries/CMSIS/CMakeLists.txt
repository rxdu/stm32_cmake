# Add libraries
add_library(cmsis INTERFACE)
target_compile_definitions(cmsis INTERFACE -D${MCU_FAMILY})
target_include_directories(cmsis INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Core/Include>
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Device/ST/STM32F1xx/Include>
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Device/ST/STM32F4xx/Include>
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Device/ST/STM32F7xx/Include>)
