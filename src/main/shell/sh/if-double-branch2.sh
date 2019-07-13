#!/bin/bash
# 判断apache是否启动
# 配合定时任务，apache服务停止后，自动重启服务
# Author: TosinJia

# 使用nmap命令扫描服务器，并截取apache服务的状态，赋予变量status
status=$(nmap -sT 127.0.0.1 | grep tcp | grep http | awk '{print $2}')

# 变量status，作为一个字符串和 字符串open比较，变量必须加双引号
if [ "open" == "$status" ]
    then
        echo "$(date) apache is ok!" >> /tmp/autostart-acc.log
    else
        /etc/init.d/httpd  restart &> /dev/null
        echo "$(date) apache was restart!" >> /tmp/autostart-err.log
fi