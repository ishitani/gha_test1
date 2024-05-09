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

./mach build

# ls -la .

# set +e

# rm -rf configure.py
# ./mach build
# rm -rf moz.build
# ./mach build
# rm -rf configure.in
# ./mach build
# rm -rf README.md
# ./mach build
# rm -rf moz.configure
# ./mach build
# rm -rf .ycm_extra_conf.py
# ./mach build
# rm -rf aclocal.m4
# ./mach build
# rm -rf build/pymake
# ./mach build
# rm -rf build/autoconf
# ./mach build
# rm -rf build/autoconf/mozconfig-find
# ./mach build
# rm -rf build/autoconf/mozconfig2client-mk
# ./mach build
# rm -rf build/dumbmake-dependencies
# ./mach build
# rm -rf build/pypng
# ./mach build
# # rm -rf build
# # ./mach build

# rm -rf client.mk
# ./mach build

# rm -rf config/baseconfig.mk
# ./mach build
# rm -rf config/makefiles/autotargets.mk
# ./mach build
# rm -rf config/makefiles/makeutils.mk
# ./mach build
# rm -rf config/configobj.py
# ./mach build
# rm -rf config/config.mk
# ./mach build
# rm -rf config/printconfigsetting.py
# ./mach build
# rm -rf config/rules.mk
# ./mach build
# rm -rf config/recurse.mk
# ./mach build

# find . -type f
