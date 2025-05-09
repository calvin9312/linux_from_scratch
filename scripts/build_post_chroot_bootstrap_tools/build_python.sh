#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="Python-3.13.2"
tar -xvf ${PKG_DIR}.tar.xz
cd ${PKG_DIR}

./configure --prefix=/usr \
--enable-shared \
--without-ensurepip

make
make install

cd $LFS/sources
rm -rf ${PKG_DIR}
