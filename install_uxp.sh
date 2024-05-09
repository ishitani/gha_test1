#!/bin/bash
set -eux

WSDIR=$(cd $(dirname $0); pwd)
cd $WSDIR/uxp_gui/

if [ ! -d ${WSDIR}/platform ]; then
    # Retrieve UXP tarball
    UXP_TGZ=RB_20231106.tar.gz
    UXP_VERSION=v0.0.1
    wget --progress=dot:giga -c \
         https://github.com/CueMol/uxp_release/releases/download/$UXP_VERSION/$UXP_TGZ
    rm -rf uxp
    set +e
    tar xzf $UXP_TGZ
    set -e
    mv uxp platform
fi

ls -la .

set +e
rm -rf .mozconfig
./mach build
rm -rf   .ycm_extra_conf.py
./mach build
rm -rf   README.md
./mach build
rm -rf   aclocal.m4
./mach build
rm -rf   build
./mach build
rm -rf   client.mk
./mach build
rm -rf   config
./mach build
rm -rf   configure.in
./mach build
rm -rf   configure.py
./mach build
rm -rf   moz.build
./mach build
rm -rf   moz.configure
./mach build
