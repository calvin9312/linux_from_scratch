#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="binutils-2.44"
tar -xvf ${PKG_DIR}.tar.xz
cd ${PKG_DIR}

sed '6031s/$add_dir//' -i ltmain.sh

mkdir -v build
cd build

../configure \
--prefix=/usr \
--build=$(../config.guess) \
--host=$LFS_TGT \
--disable-nls \
--enable-shared \
--enable-gprofng=no \
--disable-werror \
--enable-64-bit-bfd \
--enable-new-dtags \
--enable-default-hash-style=gnu

make
make DESTDIR=$LFS install

rm -v $LFS/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes,sframe}.{a,la}

cd $LFS/sources
rm -rf ${PKG_DIR}
