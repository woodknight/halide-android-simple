cmake_minimum_required(VERSION 3.10)

# set compiler path
if(NOT ANDROID)
    set(CMAKE_C_COMPILER "/opt/llvm-project/build/bin/clang")
    set(CMAKE_CXX_COMPILER "/opt/llvm-project/build/bin/clang++")
endif()

set(CMAKE_CXX_STANDARD 11)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE DEBUG)
endif()

# project name
project(hello-halide CXX)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

# halide
set(HALIDE_DISTRIB_DIR "/opt/Halide/build/install/")
include("${HALIDE_DISTRIB_DIR}/halide.cmake")

add_subdirectory(src)