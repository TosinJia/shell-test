#!/bin/bash
# 类似批量解压缩脚本
# Author: TosinJia

cd /root/sh/
ls *.sh > ls.log

lineNumber=1
for i in $(cat ls.log) ; do
    echo -e "$lineNumber: \t $i"
    lineNumber=$(( lineNumber+1 ))
done
rm -rf ls.log

