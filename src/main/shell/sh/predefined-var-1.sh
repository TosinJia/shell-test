#!/bin/bash
# Author: TosinJia

# 输出当前进程的PID，这个PID就是这个脚本执行时，生成的进程PID
echo "The current process is $$"

# 使用find命令在/root目录下查找 var 相关的文件；符号&把命令放入后台执行，工作管理在系统管理章节详解
find /root -name *var* &

# 后台运行的最后一个进程的进程号
echo "The last one Daemon process is $!"