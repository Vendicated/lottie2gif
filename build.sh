#!/bin/sh

set -e

J="$(grep -c ^processor /proc/cpuinfo)"

(
cd rlottie
mkdir -p build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local ..
make -j "$J"
sudo make install
)

(
cd LFE
make -j "$J"
)
