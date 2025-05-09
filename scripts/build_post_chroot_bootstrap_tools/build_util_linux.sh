#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="util-linux-2.40.4"
tar -xvf ${PKG_DIR}.tar.xz
cd ${PKG_DIR}

mkdir -pv /var/lib/hwclock

./configure --libdir=/usr/lib \
--runstatedir=/run \
--disable-chfn-chsh \
--disable-login \
--disable-nologin \
--disable-su \
--disable-setpriv \
--disable-runuser \
--disable-pylibmount \
--disable-static \
--disable-liblastlog2 \
--without-python \
ADJTIME_PATH=/var/lib/hwclock/adjtime \
--docdir=/usr/share/doc/util-linux-2.40.4

make
make install

cd $LFS/sources
rm -rf ${PKG_DIR}
