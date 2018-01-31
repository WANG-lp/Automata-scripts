#!/usr/bin/env bash
PREFIX="/ghome/lwangay/root"
TMP="/dev/shm"

VERSION="1.58.0"

echo "downloading source file"
curl -L -C - https://nchc.dl.sourceforge.net/project/boost/boost/${VERSION}/boost_${VERSION//./_}.tar.gz -o ${TMP}/boost.tar.gz

echo "extract"
tar xzf ${TMP}/boost.tar.gz -C ${TMP}
cd ${TMP}/boost_${VERSION//./_}

echo "compile"
./bootstrap.sh --prefix=${PREFIX}
./b2 install

cd ~
rm -rf ${TMP}/boost_${VERSION//./_}
rm -f ${TMP}/boost.tar.gz

echo "done."