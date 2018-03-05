#!/usr/bin/env bash
PREFIX="/home/will/root"
TMP="/dev/shm"

VERSION="3.10.2"

echo "downloading source file"
curl -L -C - https://cmake.org/files/v${VERSION%.*}/cmake-${VERSION}-Linux-x86_64.tar.gz -o ${TMP}/cmake.tar.gz

echo "extract"
tar xzf ${TMP}/cmake.tar.gz -C ${PREFIX}

cd ~
rm -f ${TMP}/cmake.tar.gz

echo "done."