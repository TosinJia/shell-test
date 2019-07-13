#!/bin/bash
# 从1加到100
# Author: TosinJia

i=1
sum=0

# 如果变量i的值小于等于100则进行循环
while [ $i -le 100 ]; do
    sum=$(( $sum + $i ))
    i=$(($i+1))
done

echo "The sum is $sum."
