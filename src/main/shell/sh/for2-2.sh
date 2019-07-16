#!/bin/bash
# 批量添加指定数量的用户
# Author: TosinJia

# 输入用户名前缀
read -t 30 -p "Please input Username prefix: " namePrefix
# 输入用户数量
read -t 30 -p "Please input amount of users: " num
# 输入密码
read -s -t 30 -p "Pleanse input password: " pass

echo -e "$namePrefix\t$num\t$pass"

if [ -n $namePrefix -a -n $num -a -n $pass ]
    then
        # 判读用户数量是否为纯数字
        testnum=$(echo $num | sed -e 's/[0-9]//g')
        echo "testnum: $testnum"
        if [ -z $testnum ]
            then
               echo "create user"
            else
                echo "Amount of users must be a pure number."
        fi

    else
        echo "Username prefix,amount of users,password can not be empty"
fi