# halide-android-simple

Simple Halide program that is built on the host and cross-compiled for Android, then executed through `adb shell`.

## Why There Are Two Build Steps

Halide uses a host-side generator executable to produce the pipeline artifacts that are later linked into the final program. For Android, that means:

1. Build the generator and generated Halide library for the host machine.
2. Cross-compile the final Android binary with the Android NDK, reusing the host-generated Halide artifacts.

This repository encodes that flow in `build_x86.sh` and `build_android.sh`.

## Prerequisites

- CMake 3.20 or newer
- A host build toolchain capable of building C++17 code
- A Halide installation built for the host machine
- Android NDK
- `adb` for pushing and running the binary on a device

Create a `.env` file in the repository root with these variables:

```bash
Halide_DIR="$HOME/Code/Halide/build/install"
ANDROID_NDK="$HOME/Applications/android-ndk-r27d"
```

`Halide_DIR` should point to the host Halide CMake package location. `ANDROID_NDK` should point to the Android NDK root used by the CMake Android toolchain file.

## Cross-Compile Process

### 1. Build host-side Halide artifacts

```bash
./build_x86.sh
```

This configures `build/` and builds:

- the Halide generator executable
- the generated `hello` pipeline artifacts
- the CMake package data later consumed by the Android build

The Android build depends on these host-generated outputs through:

```bash
-DHELLO-halide_generators_ROOT="$(pwd)/build/"
```

### 2. Cross-compile for Android

```bash
./build_android.sh
```

This configures `build_android/` with the Android NDK toolchain and currently targets:

- ABI: `arm64-v8a`
- Android platform: `android-30`
- build type: `Release`

The resulting Android executable is built at:

```text
build_android/src/main
```

## Run On Device

Connect an Android device visible to `adb`, then run:

```bash
./adb_run_on_device.sh
```

The script will:

1. create `/data/local/tmp/halide_android` on the device
2. push `build_android/src/main`
3. execute the binary with `adb shell`

## Full Sequence

```bash
./build_x86.sh
./build_android.sh
./adb_run_on_device.sh
```

If you change the Halide generator implementation in `src/hello_generator.cpp`, rerun the full sequence so the host-generated artifacts and Android binary stay in sync.