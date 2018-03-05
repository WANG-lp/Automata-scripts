#!/usr/bin/env bash
VERSION="2.2.1"

PREFIX="/ghome/lwangay/root"
TMP="/dev/shm"

echo "downloading source file"
curl -L -C - https://github.com/gflags/gflags/archive/v${VERSION}.tar.gz -o ${TMP}/gflags.tar.gz

echo "extract"
tar xzf ${TMP}/gflags.tar.gz -C ${TMP}
cd ${TMP}/gflags-${VERSION}

echo "compile"
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DINSTALL_HEADERS=ON ..
make -j4
make install

cd ~
rm -rf ${TMP}/gflags-${VERSION}
rm -f ${TMP}/gflags.tar.gz

echo "done."