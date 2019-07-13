#!/bin/bash
# 判断用户数据
# Author: TosinJia

read -p "Please input yes/no: " -t 30 cho

case $cho in
    "yes")
        echo "You input yes ."
        ;;
    "no")
        echo "You input $cho ."
        ;;
     *)
        echo "You input other."
        ;;
esac