#!/bin/bash
# Author: TosinJia

# 提示 并等待30秒，把用户的输入保存入变量name中
read -t 30 -p "Please input your name:" name
echo "Name is $name"

# 年龄是隐私，所以我们使用 -s 选项隐藏输入
read -s -t 30 -p "Please input your age:" age
echo -e "\n"
echo "Age is $age"

# 使用 -n 1 选项只接受一个输入字符就会执行（都不用回车）
read -n 1 -t 30 -p "Please input your gender[M/F]:" gender
echo -e "\n"
echo "Sex is $gender"