#!/bin/sh

#代码打包
mvn clean -U package -DskipTests > /dev/null

#上传代码
scp ./target/mica-security.jar tx1:/home/java/
scp ./script/start.sh tx1:/home/java/

#远程执行命令
ssh tx1 "chmod u+x /home/java/start.sh; /home/java/start.sh"
