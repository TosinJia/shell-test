#!/usr/bin/env bash
# Author: TosinJia
# [root@bogon ~]# date "+%y%m%d %H:%M:%S"
# 等价于date=$(date "+%y%m%d")
date=$(date +\%y\%m\%d_\%H\%M\%S)
size=$(du -sh /etc)
# Idea  mkdir: cannot create directory '/tmp': Permission denied
# $(mkdir -p ~/tmp/dbbak)
mkdir -p ~/tmp/dbbak
echo "Date: $date" > ~/tmp/dbbak/dbinfo.txt
echo "Data size: $size" >> ~/tmp/dbbak/dbinfo.txt
cd ~/tmp/dbbak
tar -zcf etc_$date.tar.gz /etc ~/tmp/dbbak/dbinfo.txt &> /dev/null
rm -rf ~/tmp/dbbak/dbinfo.txt
