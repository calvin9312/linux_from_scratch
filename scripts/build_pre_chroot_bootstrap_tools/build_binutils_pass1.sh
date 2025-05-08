#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="binutils-2.44"
tar -xvf ${PKG_DIR}.tar.xz
cd ${PKG_DIR}

mkdir -v build
cd build

../configure --prefix=$LFS/tools \
--with-sysroot=$LFS \
--target=$LFS_TGT \
--disable-nls \
--enable-gprofng=no \
--disable-werror \
--enable-new-dtags \
--enable-default-hash-style=gnu

make
make install

cd $LFS/sources
rm -rf ${PKG_DIR}
