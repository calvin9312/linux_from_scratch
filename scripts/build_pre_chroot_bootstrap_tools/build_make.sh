#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="make-4.4.1"
tar -xvf ${PKG_DIR}.tar.gz
cd ${PKG_DIR}

./configure --prefix=/usr \
--without-guile \
--host=$LFS_TGT \
--build=$(build-aux/config.guess)

make
make DESTDIR=$LFS install

cd $LFS/sources
rm -rf ${PKG_DIR}
