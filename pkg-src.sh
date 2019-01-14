#!/usr/bin/env bash
PREFIX="/home/lwangay/root"
TMP="."


echo "downloading pkg-src.tar.gz"
curl -L -C - https://cdn.netbsd.org/pub/pkgsrc/pkgsrc-2018Q4/pkgsrc.tar.gz -o ${TMP}/pkgsrc.tar.gz

echo "extract"
tar xzf ${TMP}/pkgsrc.tar.gz -C ${TMP}

echo "compile"
cd ${TMP}/pkgsrc
./bootstrap/bootstrap --unprivileged
echo "done."
