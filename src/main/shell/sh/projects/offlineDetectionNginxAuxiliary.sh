#!/bin/bash
# nginx辅助脚本
# Author: Tosin

dateTime=$(date "+%y-%m-%d %H:%M:%S")

# 获取可用的主机IP
aliveServers=$(nmap -sT -p 8000 -oG - 192.168.1.59,60 | grep open | awk '{printf $2 " "}')
aliveServer1=$(echo "$aliveServers" | cut -d " " -f 1)
aliveServer2=$(echo "$aliveServers" | cut -d " " -f 2)

# 获取配置文件中指定的主机IP
curServer=$(cat /usr/local/nginx/conf/nginx.conf | grep server | grep :8000 | awk '{print $2}' | cut -d ":" -f 1)

echo -e "$dateTime: aliveServers : $aliveServers \t aliveServer1: $aliveServer1 \t aliveServer2: $aliveServer2 \t curServer: $curServer" >> /tmp/nginx/auxiliary.info

# 日志目录不存在则创建
if [ ! -d /tmp/nginx ]
  then
    mkdir /tmp/nginx
fi

# 当前服务都不可用
if [ -z "$aliveServer1" -a -z "$aliveServer2" ]; then
    echo "$dateTime: No service currently available." >> /tmp/nginx/auxiliary.error
    exit 1
fi

# 当前服务都可用
if [ -n "$aliveServer1" -a -n "$aliveServer2" ]; then
    echo "$dateTime: All services are available." >> /tmp/nginx/auxiliary.info
    exit 0
fi

# 当前只有一个服务可用
if [ "$curServer" == "$aliveServer1" ]
    then
        echo "$dateTime: Current server is available." >> /tmp/nginx/auxiliary.info
        exit 0
    else
        #修改配置文件，重启nginx
        sed -i -e "s/$curServer/$aliveServer1/g" /usr/local/nginx/conf/nginx.conf &> /dev/null
        /usr/local/nginx/sbin/nginx -s reload &> /dev/null
        echo "$dateTime: Current server $curServer is unavailable, switch to server $aliveServer1!!" >> /tmp/nginx/auxiliary.error
        exit 0
fi
