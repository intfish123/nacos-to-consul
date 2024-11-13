FROM alibabadragonwell/dragonwell:17-anolis

WORKDIR /workspace

RUN yum update -y && yum install -y wget curl telnet ca-certificates git bash sudo tzdata curl fontconfig dejavu-fonts-common dejavu-sans-fonts
RUN mkdir logs

COPY target/nacos-to-consul-0.0.1.jar nacos-to-consul.jar

ENV TZ="Asia/Shanghai"
ENV JAVA_OPTS="-Xms256m -Xmx2048m -Duser.timezone=$TZ -Djava.security.egd=file:/dev/./urandom "
CMD java $JAVA_OPTS -jar nacos-to-consul.jar

