#!/usr/bin/env bash

set -e

source .env

cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH="$Halide_DIR"

cmake --build build -j"$(nproc)"