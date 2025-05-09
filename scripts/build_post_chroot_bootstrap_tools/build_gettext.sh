#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="bison-3.8.2"
tar -xvf ${PKG_DIR}.tar.xz
cd ${PKG_DIR}

./configure --prefix=/usr \
--docdir=/usr/share/doc/bison-3.8.2

make
make install

cd $LFS/sources
rm -rf ${PKG_DIR}
