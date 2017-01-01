#!/usr/bin/env bash

# to run the generated program, using the command: ./psplash -n -p -m

export CROSS_COMPILE=arm-linux-gnueabihf-
export ARCH=arm
export PATH=$PATH:/home/cason/src/projects/jisuanqi/toolchain/gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabihf/bin
./autogen.sh --host=arm-linux CC=arm-linux-gnueabihf-gcc
make
