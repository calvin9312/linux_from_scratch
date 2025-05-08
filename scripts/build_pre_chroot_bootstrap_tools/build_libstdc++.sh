#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="gcc-14.2.0"
tar -xvf ${PKG_DIR}.tar.xz
cd ${PKG_DIR}


mkdir -v build
cd build


../libstdc++-v3/configure \
--host=$LFS_TGT \
--build=$(../config.guess) \
--prefix=/usr \
--disable-multilib \
--disable-nls \
--disable-libstdcxx-pch \
--with-gxx-include-dir=/tools/$LFS_TGT/include/c++/14.2.0

make
make DESTDIR=$LFS install

rm -v $LFS/usr/lib/lib{stdc++{,exp,fs},supc++}.la

cd $LFS/sources
rm -rf ${PKG_DIR}

