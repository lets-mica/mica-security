#!/bin/sh

#代码打包
mvn clean -U package -DskipTests > /dev/null

#重命名jar
mv ./target/dream-security-*.jar ./target/dream-security.jar

#上传代码
scp ./target/dream-security.jar txyun:/root/jar/
scp ./script/start.sh txyun:/root/jar/

#远程执行命令
ssh txyun "chmod u+x /root/jar/start.sh; /root/jar/start.sh"
