#!/bin/bash
# 批量解压缩脚本
# Author: TosinJia

cd /root/tar/
ls *.tar.gz > ls.log

for i in $(cat ls.log) ; do
    tar -zxf "$i" &> /dev/null
done
rm -rf ls.log

