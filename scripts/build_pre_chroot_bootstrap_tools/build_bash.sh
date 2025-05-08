#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="bash-5.2.37"
tar -xvf ${PKG_DIR}.tar.gz
cd ${PKG_DIR}


./configure --prefix=/usr \
--build=$(sh support/config.guess) \
--host=$LFS_TGT \
--without-bash-malloc

make
make DESTDIR=$LFS install
ln -sv bash $LFS/bin/sh

cd $LFS/sources
rm -rf ${PKG_DIR}
