#!/usr/bin/env bash
PREFIX="/ghome/lwangay/root"
TMP="/dev/shm"

VERSION="2.0.2"

echo "downloading htop-${VERSION}.tar.gz"
curl -L -C - http://hisham.hm/htop/releases/${VERSION}/htop-${VERSION}.tar.gz -o ${TMP}/htop.tar.gz

echo "extract"
tar xzf ${TMP}/htop.tar.gz -C ${TMP}

echo "compile"
cd ${TMP}/htop-${VERSION}
./configure --prefix=${PREFIX}
make -j4
make install

cd ~
rm -rf ${TMP}/htop-${VERSION}
rm -f ${TMP}/htop.tar.gz

echo "done."
