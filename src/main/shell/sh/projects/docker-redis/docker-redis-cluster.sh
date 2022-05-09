#!/bin/bash
# envsubst 命令详解 https://blog.csdn.net/oopxiajun2011/article/details/111668011
for port in `seq 6371 6373`; do
  echo "port is $port .";
  mkdir -p ${port}/conf && PORT=${port} envsubst < redis-cluster.tmpl > ${port}/conf/redis.conf && mkdir -p ${port}/data;
done
