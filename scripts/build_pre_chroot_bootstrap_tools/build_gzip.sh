#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="gzip-1.13"
tar -xvf ${PKG_DIR}.tar.xz
cd ${PKG_DIR}

./configure --prefix=/usr --host=$LFS_TGT

make
make DESTDIR=$LFS install

cd $LFS/sources
rm -rf ${PKG_DIR}
