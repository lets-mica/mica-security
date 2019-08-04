FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER 596392912@qq.com

RUN mkdir -p /dream/bin/net.dreamlu/dream-security

WORKDIR /dream/bin/net.dreamlu/dream-security

EXPOSE 9000

ADD ./target/dream-security.jar ./

CMD java -Djava.security.egd=file:/dev/./urandom -jar dream-security.jar --server.port=9000
