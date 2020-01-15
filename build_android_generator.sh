#!/bin/bash

mkdir -p gen_files

HALID_DIR="/opt/Halide/build/install/"
COMPILER="/opt/llvm-project/build/bin/clang++"

${COMPILER} src/hello_generator.cpp ${HALID_DIR}/tools/GenGen.cpp \
    -g -std=c++11 -fno-rtti -Wall \
    -I ${HALID_DIR}/include \
    -L ${HALID_DIR}/bin -lHalide \
    -lpthread -ldl \
    -o gen_files/hello_generator

./gen_files/hello_generator -g hello -o gen_files target=arm-64-android