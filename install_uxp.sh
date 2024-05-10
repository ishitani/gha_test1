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

WIN32_REDIST_DIR="$1"
echo "$WIN32_REDIST_DIR"
WIN_UCRT_REDIST_DIR="2" #${WindowsSdkDir}Redist\\${WindowsSDKLibVersion}ucrt\\DLLs\\x64"
echo "$WIN_UCRT_REDIST_DIR"

sed "s!@CUEMOL_BUNDLE@!$BUNDLE_DIR!g" mozconfig_win_x64 \
    | sed "s!@CUEMOL_DIR@!$CUEMOL_DIR!g" \
    | sed "s!@BOOST_DIR@!$BOOST_DIR!g" \
    | sed "s!@DEPLIBS_DIR@!$LIBDIR!g" \
    | sed "s!@WIN32_REDIST_DIR@!$WIN32_REDIST_DIR!g" \
    | sed "s!@WIN_UCRT_REDIST_DIR@!$WIN_UCRT_REDIST_DIR!g" > .mozconfig

./mach build

