#!/bin/bash
# 备份目录/可用于备份mysql数据库完整目录（不是增量、差异备份）
# 脚本中尽可能使用绝对路径
# Author: TosinJia

# 同步系统时间
ntpdate asia.pool.ntp.org &> /dev/null

# 把当前系统时间按照“年月日”格式赋予变量date
date=$(date +%y%m%d%H%M)
# 统计目录大小，并把大小赋予size变量
size=$(du -sh /etc/)
# 备份目录/tmp/dirbak

if [ -d /tmp/dirbak ]
    then
        cd /tmp/dirbak
        echo "Date: $date" > /tmp/dirbak/bak.info
        echo "Data size: $size" >> /tmp/dirbak/bak.info
        tar -zcf bak-$date.tar.gz /etc/ bak.info &> /dev/null
        rm -rf /tmp/dirbak/bak.info
    else
        mkdir /tmp/dirbak
        cd /tmp/dirbak
        echo "Date: $date" > /tmp/dirbak/bak.info
        echo "Data size: $size" >> /tmp/dirbak/bak.info
        tar -zcf bak-$date.tar.gz /etc/ bak.info &> /dev/null
        rm -rf /tmp/dirbak/bak.info
fi
