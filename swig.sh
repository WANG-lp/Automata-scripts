#!/usr/bin/env bash
PREFIX="/ghome/lwangay/root"
TMP="/dev/shm"

VERSION="3.0.12"

echo "downloading source file"
curl -L -C - http://prdownloads.sourceforge.net/swig/swig-${VERSION}.tar.gz -o ${TMP}/swig.tar.gz

echo "extract"
tar xzf ${TMP}/swig.tar.gz -C ${TMP}
cd ${TMP}/swig-${VERSION}

echo "compile"
./configure --prefix=${PREFIX}
make -j4
make install

cd ~
rm -rf ${TMP}/swig-${VERSION}
rm -f ${TMP}/swig.tar.gz

echo "done."