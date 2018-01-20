#!/usr/bin/env bash

PREFIX="/home/will/hadoop-test"
HADOOP_VERSION="2.7.4"
HADOOP_CONF_DIR="${PREFIX}/hadoop-${HADOOP_VERSION}/etc/hadoop"

echo "create dir"
mkdir -p ${PREFIX}

echo "download hadoop-${HADOOP_VERSION}.tar.gz"
curl -L -C - http://apache.01link.hk/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz -o ${PREFIX}/hadoop-${HADOOP_VERSION}.tar.gz

echo "extract hadoop binary files"
tar xzf ${PREFIX}/hadoop-${HADOOP_VERSION}.tar.gz -C ${PREFIX}

echo "copy configure files"



echo "done"
