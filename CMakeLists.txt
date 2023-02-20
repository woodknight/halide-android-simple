cmake_minimum_required(VERSION 3.20)

# project name
project(hello-halide C CXX)

set(CMAKE_CXX_STANDARD 17)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif()

# halide
find_package(Halide REQUIRED)

add_subdirectory(src)