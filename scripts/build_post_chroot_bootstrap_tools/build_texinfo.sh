#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="texinfo-7.2"
tar -xvf ${PKG_DIR}.tar.xz
cd ${PKG_DIR}

./configure --prefix=/usr

make
make install

cd $LFS/sources
rm -rf ${PKG_DIR}
