#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="gettext-0.24"
tar -xvf ${PKG_DIR}.tar.xz
cd ${PKG_DIR}

./configure --disable-shared

make
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin

cd $LFS/sources
rm -rf ${PKG_DIR}
