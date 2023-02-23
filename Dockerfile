FROM openjdk:19-jdk-alpine3.15
WORKDIR /
RUN set -eux && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update && apk upgrade && apk --no-cache add tzdata ca-certificates bash sudo pkgconf
RUN echo "hosts: files dns" > /etc/nsswitch.conf
#RUN echo "UTC" >  /etc/timezone
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' >/etc/timezone
RUN mkdir /logs

COPY target/nacos-to-consul-0.0.1.jar /nacos-to-consul.jar
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x docker-entrypoint.sh

ENV TZ="Asia/Shanghai"
ENV JAVA_OPTS="-Xms256m -Xmx2048m -Duser.timezone=$TZ -Djava.security.egd=file:/dev/./urandom "
CMD java $JAVA_OPTS -jar /nacos-to-consul.jar

