#!/usr/bin/env bash
PREFIX="/home/lwangay/root"
TMP="/dev/shm"

VERSION="6.1"

echo "downloading ncurses-${VERSION}.tar.gz"
curl -L -C - https://github.com/mirror/ncurses/archive/v${VERSION}.tar.gz -o ${TMP}/ncurses.tar.gz

echo "extract"
tar xzf ${TMP}/ncurses.tar.gz -C ${TMP}

echo "compile"
cd ${TMP}/ncurses-${VERSION}
./configure --prefix=${PREFIX} --with-shared --enable-widec --without-normal  --without-debug
make -j4
make install

cd ~
rm -rf ${TMP}/ncurses-${VERSION}
rm -f ${TMP}/ncurses.tar.gz

echo "done."
