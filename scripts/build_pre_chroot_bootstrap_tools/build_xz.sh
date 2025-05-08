#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="xz-5.6.4"
tar -xvf ${PKG_DIR}.tar.xz
cd ${PKG_DIR}

./configure --prefix=/usr \
--host=$LFS_TGT \
--build=$(build-aux/config.guess) \
--disable-static \
--docdir=/usr/share/doc/xz-5.6.4

make
make DESTDIR=$LFS install

rm -v $LFS/usr/lib/liblzma.la

cd $LFS/sources
rm -rf ${PKG_DIR}
