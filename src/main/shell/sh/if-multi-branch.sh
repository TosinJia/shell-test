#!/bin/bash
# 判断用户输入的是什么文件
# Author: TosinJia

# 接收键盘的输入，并赋予变量file
read -p "Please input a filename:" file

# 判断file变量是否为空
if [ -z "$file" ]
    then
        echo "Filename is empty!"
        exit 1
# 判断file不存在
elif [ ! -e "$file" ]
    then
# （链接文件 ）
        echo "$file does not exist!"
# exit 2 退出程序；如果不写，这部分程序执行了，还会继续向下执行，而不会终止if语句
# 一旦发现报错（输入的是空，或者是不存在的文件），后边的内容就不需要再判断了，直接跳出
        exit 2
# 判断file的值是否为普通文件
elif [ -f "$file" ]
    then
        echo "$file is a normal file."
        exit 3
# 判断file的值是否为目录文件
elif [ -d "$file" ]
    then
        echo "$file is a directory."
else
# 管道符文件
    echo "$file is a other type of file."
fi