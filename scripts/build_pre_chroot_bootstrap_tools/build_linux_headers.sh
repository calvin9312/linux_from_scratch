#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="linux-6.13.4"
tar -xvf ${PKG_DIR}.tar.xz
cd ${PKG_DIR}

make mrproper
make headers
find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include $LFS/usr

cd $LFS/sources
rm -rf ${PKG_DIR}
