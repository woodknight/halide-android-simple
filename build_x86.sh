set -e

mkdir -p build
cd build

cmake -DCMAKE_PREFIX_PATH="${Halide_DIR}" ../

cmake --build .