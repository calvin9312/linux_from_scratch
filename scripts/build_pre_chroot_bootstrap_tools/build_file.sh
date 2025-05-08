#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="file-5.46"
tar -xvf ${PKG_DIR}.tar.gz
cd ${PKG_DIR}

mkdir build
pushd build
../configure --disable-bzlib \
--disable-libseccomp \
--disable-xzlib \
--disable-zlib
make
popd

./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)

make FILE_COMPILE=$(pwd)/build/src/file
make DESTDIR=$LFS install
rm -v $LFS/usr/lib/libmagic.la

cd $LFS/sources
rm -rf ${PKG_DIR}
