#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="ncurses-6.5"
tar -xvf ${PKG_DIR}.tar.xz
cd ${PKG_DIR}

mkdir -v build
cd build

mkdir build
pushd build
../configure AWK=gawk
make -C include
make -C progs tic
popd

./configure --prefix=/usr \
--host=$LFS_TGT \
--build=$(./config.guess) \
--mandir=/usr/share/man \
--with-manpage-format=normal \
--with-shared \
--without-normal \
--with-cxx-shared \
--without-debug \
--without-ada \
--disable-stripping \
AWK=gawk

make
make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install
ln -sv libncursesw.so $LFS/usr/lib/libncurses.so
sed -e 's/^#if.*XOPEN.*$/#if 1/' -i $LFS/usr/include/curses.h


cd $LFS/sources
rm -rf ${PKG_DIR}
