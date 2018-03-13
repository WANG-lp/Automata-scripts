#!/usr/bin/env bash
PREFIX="/ghome/lwangay/root"
TMP="/dev/shm"

VERSION="2.6"

echo "downloading source file"
curl -L -C - https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz -o ${TMP}/tmux.tar.gz

echo "extract"
tar xzf ${TMP}/tmux.tar.gz -C ${TMP}
cd ${TMP}/tmux-${VERSION}

echo "compile"
./configure --prefix=${PREFIX} CFLAGS="-I${PREFIX}/include" LDFLAGS="-L${PREFIX}/lib"
make -j4
make install

cd ~
rm -rf ${TMP}/tmux-${VERSION}
rm -f ${TMP}/tmux.tar.gz

echo "done."
