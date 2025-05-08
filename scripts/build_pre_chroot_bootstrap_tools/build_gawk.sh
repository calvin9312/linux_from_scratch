#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="gawk-5.3.1"
tar -xvf ${PKG_DIR}.tar.xz
cd ${PKG_DIR}

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr \
--host=$LFS_TGT \
--build=$(build-aux/config.guess)

make
make DESTDIR=$LFS install

cd $LFS/sources
rm -rf ${PKG_DIR}
