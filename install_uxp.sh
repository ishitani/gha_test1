#!/bin/bash
set -eux

WSDIR=$(cd $(dirname $0); pwd)
cd $WSDIR/uxp_gui/

if [ ! -d ${WSDIR}/uxp_gui/platform ]; then
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
./mach build
rm -rf build/mach_bootstrap.py
./mach build
rm -rf build/pymake
./mach build
rm -rf build/autoconf
./mach build
rm -rf build/autoconf/mozconfig-find
./mach build
rm -rf build/autoconf/mozconfig2client-mk
./mach build
rm -rf build/dumbmake-dependencies
./mach build
rm -rf build/pypng
./mach build
rm -rf build
./mach build

