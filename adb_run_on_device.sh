#!/bin/bash

DEVICE_PATH=/data/local/tmp/halide_android

adb shell mkdir -p ${DEVICE_PATH}
adb push build_android/bin/yo ${DEVICE_PATH}
adb shell chmod +x ${DEVICE_PATH}/yo
adb shell cd ${DEVICE_PATH}
adb shell ${DEVICE_PATH}/yo