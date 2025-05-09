#!/bin/bash

source ~/.bashrc

cd $LFS/sources

PKG_DIR="perl-5.40.1"
tar -xvf ${PKG_DIR}.tar.xz
cd ${PKG_DIR}

sh Configure -des \
-D prefix=/usr \
-D vendorprefix=/usr \
-D useshrplib \
-D privlib=/usr/lib/perl5/5.40/core_perl \
-D archlib=/usr/lib/perl5/5.40/core_perl \
-D sitelib=/usr/lib/perl5/5.40/site_perl \
-D sitearch=/usr/lib/perl5/5.40/site_perl \
-D vendorlib=/usr/lib/perl5/5.40/vendor_perl \
-D vendorarch=/usr/lib/perl5/5.40/vendor_perl

make
make install

cd $LFS/sources
rm -rf ${PKG_DIR}
