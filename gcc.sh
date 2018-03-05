#!/usr/bin/env bash
VERSION="4.9.4"

PREFIX="/home/will/root/gcc-${VERSION}"
TMP="/dev/shm"

echo "downloading source file"
curl -L -C - http://ftp.kaist.ac.kr/gnu/gcc/gcc-${VERSION}/gcc-${VERSION}.tar.gz -o ${TMP}/gcc.tar.gz

echo "extract"
tar xzf ${TMP}/gcc.tar.gz -C ${TMP}
cd ${TMP}/gcc-${VERSION}

echo "compile"
bash ./contrib/download_prerequisites
./configure --prefix=${PREFIX} --enable-checking=release --enable-languages=c,c++ --disable-multilib
make
make install

cd ~
rm -rf ${TMP}/gcc-${VERSION}
rm -f ${TMP}/gcc.tar.gz

echo "done."