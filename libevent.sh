#!/usr/bin/env bash
PREFIX="/home/lwangay/root"
TMP="/dev/shm"

VERSION="2.1.8-stable"

echo "downloading libevent-${VERSION}.tar.gz"
curl -L -C - https://github.com/libevent/libevent/releases/download/release-${VERSION}/libevent-${VERSION}.tar.gz -o ${TMP}/libevent.tar.gz

echo "extract"
tar xzf ${TMP}/libevent.tar.gz -C ${TMP}

echo "compile"
cd ${TMP}/libevent-${VERSION}
./configure --prefix=${PREFIX} --disable-static
make -j4
make install

cd ~
rm -rf ${TMP}/libevent-${VERSION}
rm -f ${TMP}/libevent.tar.gz

echo "done."
