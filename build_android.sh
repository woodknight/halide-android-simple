#!/usr/bin/env bash

set -e

source .env

cmake -S . -B build_android \
      -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK}/build/cmake/android.toolchain.cmake" \
      -DANDROID_ABI="arm64-v8a" \
      -DANDROID_PLATFORM="android-30" \
      -DCMAKE_BUILD_TYPE="Release" \
      -DCMAKE_PREFIX_PATH="${Halide_DIR}" \
      -DCMAKE_FIND_ROOT_PATH="${Halide_DIR}" \
      -DHELLO-halide_generators_ROOT="$(pwd)/build/"

cmake --build build_android -j"$(nproc)"