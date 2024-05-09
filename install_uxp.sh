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
rm -rf \
   .mozconfig \
   .ycm_extra_conf.py \
   README.md \
   aclocal.m4 \
   build \
   client.mk \
   config \
   configure.in \
   configure.py \
   moz.build \
   moz.configure
   
ls -la .
./mach build

