#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="diffutils-3.11"
tar -xvf ${PKG_DIR}.tar.xz
cd ${PKG_DIR}

./configure --prefix=/usr \
--host=$LFS_TGT \
--build=$(./build-aux/config.guess)

make
make DESTDIR=$LFS install

cd $LFS/sources
rm -rf ${PKG_DIR}
