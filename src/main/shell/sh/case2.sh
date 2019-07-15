#!/bin/bash
# 判断用户数据
# Author: TosinJia

echo "You want to xi'an, please input\"1\";"
echo 'You want to guangzhou, please input"2";'
echo 'You want to shenzhen, please input"3"'

read -t 30 -p "Please input: " cho

case "$cho" in
    "1")
        echo "xi'an"
        ;;
    "2")
        echo "guangzhou"
        ;;
    3)
        echo "shenzhen"
        ;;
    *)
        echo "other"
        ;;
esac