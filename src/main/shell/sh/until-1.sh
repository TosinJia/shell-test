#!/bin/bash
# 从1加到100
# Author: TosinJia

i=1
sum=0
until [ $i -gt 100 ]; do
    sum=$(( $sum + $i ))
    i=$(( $i+1 ))
done

echo "The sum is $sum."
