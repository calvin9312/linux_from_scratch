#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="findutils-4.10.0"
tar -xvf ${PKG_DIR}.tar.xz
cd ${PKG_DIR}

./configure --prefix=/usr \
--localstatedir=/var/lib/locate \
--host=$LFS_TGT \
--build=$(build-aux/config.guess)

make
make DESTDIR=$LFS install

cd $LFS/sources
rm -rf ${PKG_DIR}
