#!/bin/bash
# 从1加到100
# Author: TosinJia

sum=0
for (( i = 1; i <= 100; i=i+1 )); do
    sum=$(( $sum + $i ))
done
echo "The sum is $sum"

