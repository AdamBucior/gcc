#!/bin/bash

export PREFIX="/usr"
export TARGET=x86_64-elf

apt install libgmp3-dev
apt install libmpfr-dev
apt install libmpc-dev

mkdir gcc-build
cd gcc-build
../gcc/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --disable-libssp --enable-languages=c,c++ --without-headers --disable-hosted-libstdcxx --disable-bootstrap --enable-initfini-array
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc
make all-target-libstdc++-v3
make install-target-libstdc++-v3
cd ..
