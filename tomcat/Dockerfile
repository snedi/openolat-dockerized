FROM busybox

WORKDIR /tmp

RUN wget --no-check-certificate -q https://mirror.koddos.net/apache/tomcat/tomcat-8/v8.5.59/bin/apache-tomcat-8.5.59.tar.gz -O - | tar -xz
RUN wget --no-check-certificate -q http://www.openolat.org/fileadmin/downloads/releases/openolat_1520.war

FROM alpine

ARG INSTALLATION_DIR="/home/openolat"

COPY --from=0 /tmp/apache-tomcat-8.5.59 /usr/tomcat
COPY --from=0 /tmp/openolat_1520.war ${INSTALLATION_DIR}/openolat_1520.war

RUN mkdir -p ${INSTALLATION_DIR}/openolat_1520 && \
    unzip -d ${INSTALLATION_DIR}/openolat_1520 ${INSTALLATION_DIR}/openolat_1520.war && \
    ln -s ${INSTALLATION_DIR}/openolat_1520 ${INSTALLATION_DIR}/webapp

RUN apk --no-cache add openjdk8 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

COPY ./tomcat-configs/setenv.sh /usr/tomcat/bin/setenv.sh
COPY ./tomcat-configs/server.xml /usr/tomcat/conf/server.xml
COPY ./tomcat-configs/olat.local.properties /usr/tomcat/lib/olat.local.properties
COPY ./tomcat-configs/log4j2.xml /usr/tomcat/lib/log4j2.xml
COPY ./tomcat-configs/ROOT.xml /usr/tomcat/conf/Catalina/localhost/ROOT.xml

EXPOSE 8088

CMD [ "/usr/tomcat/bin/catalina.sh", "run" ]