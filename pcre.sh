#!/usr/bin/env bash
PREFIX="/ghome/lwangay/root"
TMP="/dev/shm"

VERSION="8.41"

echo "downloading source file"
curl -L -C - https://ftp.pcre.org/pub/pcre/pcre-${VERSION}.tar.gz -o ${TMP}/pcre.tar.gz

echo "extract"
tar xzf ${TMP}/pcre.tar.gz -C ${TMP}
cd ${TMP}/pcre-${VERSION}

echo "compile"
./configure --prefix=${PREFIX}
make -j4
make install

cd ~
rm -rf ${TMP}/pcre-${VERSION}
rm -f ${TMP}/pcre.tar.gz

echo "done."