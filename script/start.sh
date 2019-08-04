#!/bin/sh

cd /root/jar/

#杀死老进程
kill -9 `ps aux|grep dream-security |grep -v grep |grep java |awk '{print $2}'`

#启动
nohup java -Djava.security.egd=file:/dev/./urandom -Xmx400M -Xms400M -jar dream-security.jar --spring.profiles.active=prod &
