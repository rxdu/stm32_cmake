cmake_minimum_required(VERSION 3.0.0)
project(stm32proj C CXX ASM)

# adjust project folder name if necessary
set(STM32_PROJ_FOLDER stm32proj)

message(STATUS "Building project: ${PROJECT_NAME}")
set(STM32_CMAKE_DIR "${CMAKE_SOURCE_DIR}")

# set the default build type
if(NOT CMAKE_BUILD_TYPE) 
    set(CMAKE_BUILD_TYPE Debug)
endif(NOT CMAKE_BUILD_TYPE)

if(CMAKE_BUILD_TYPE MATCHES Debug)
  message(STATUS "Build type: Debug")
elseif(CMAKE_BUILD_TYPE MATCHES Release)
  message(STATUS "Build type: Release")
endif()

# add source folder
add_subdirectory(src)
