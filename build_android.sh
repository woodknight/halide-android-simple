set -e

mkdir -p build_android
cd build_android

cmake -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK}/build/cmake/android.toolchain.cmake" \
      -DANDROID_ABI="arm64-v8a" \
      -DANDROID_PLATFORM="android-30" \
      -DCMAKE_BUILD_TYPE="Release" \
      -DCMAKE_PREFIX_PATH="${Halide_DIR}" \
      -DCMAKE_FIND_ROOT_PATH="${Halide_DIR}" \
      -Dhello-halide-halide_generators_ROOT="../build/" \
      ../

cmake --build .