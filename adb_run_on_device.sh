#!/bin/bash
set -e

DEVICE_PATH=/data/local/tmp/halide_android

adb shell mkdir -p ${DEVICE_PATH}
adb push build_android/src/main ${DEVICE_PATH}
adb shell ${DEVICE_PATH}/main