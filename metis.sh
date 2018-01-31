#!/usr/bin/env bash
PREFIX="/ghome/lwangay/root"
TMP="/dev/shm"

VERSION="5.1.0"
ARCH="64"

echo "downloading source file"
curl -L -C - http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/metis-${VERSION}.tar.gz -o ${TMP}/metis.tar.gz

echo "extract"
tar xzf ${TMP}/metis.tar.gz -C ${TMP}
cd ${TMP}/metis-${VERSION}

echo "compile"
if [ "$ARCH" == "64" ]; then
    cd include/
    sed -i.bak 's/#define IDXTYPEWIDTH 32/#define IDXTYPEWIDTH 64/' ./metis.h
    cd ../
fi
make config prefix=${PREFIX}
make -j4
make install

cd ~
rm -rf ${TMP}/metis-${VERSION}
rm -f ${TMP}/metis.tar.gz

echo "done."