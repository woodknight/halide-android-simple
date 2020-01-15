mkdir -p build_android
cd build_android

ANDROID_NDK=${HOME}/Android/Sdk/ndk-bundle

cmake -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
      -DANDROID_ABI="arm64-v8a" \
      -DANDROID_PLATFORM=android-21 \
      ../

make