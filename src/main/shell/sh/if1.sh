#!/bin/bash
# 统计分区使用率
# Author: TosinJia

# 把分区使用率作为变量值赋予变量rate
rate=$(df -h | grep /dev/sda1 | awk '{print $5}'| cut -d "%" -f 1)
if [ $rate -gt 5 ]; then
    echo "Warning!"
fi