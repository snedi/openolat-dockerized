ARG OPENOLAT_PACKAGE_NAME_VER="openolat_1520"

FROM alpine:3

ARG OPENOLAT_PACKAGE_NAME_VER

WORKDIR /tmp

RUN wget --no-check-certificate -q https://mirror.koddos.net/apache/tomcat/tomcat-8/v8.5.73/bin/apache-tomcat-8.5.73.tar.gz -O - | tar -xz
RUN wget --no-check-certificate -q http://www.openolat.org/fileadmin/downloads/releases/${OPENOLAT_PACKAGE_NAME_VER}.war

FROM alpine:3

ARG OPENOLAT_PACKAGE_NAME_VER

ARG INSTALLATION_DIR="/home/openolat"

COPY --from=0 /tmp/apache-tomcat-8.5.73 /usr/tomcat
COPY --from=0 /tmp/${OPENOLAT_PACKAGE_NAME_VER}.war ${INSTALLATION_DIR}/${OPENOLAT_PACKAGE_NAME_VER}.war

RUN mkdir -p ${INSTALLATION_DIR}/${OPENOLAT_PACKAGE_NAME_VER} && \
    unzip -d ${INSTALLATION_DIR}/${OPENOLAT_PACKAGE_NAME_VER} ${INSTALLATION_DIR}/${OPENOLAT_PACKAGE_NAME_VER}.war && \
    ln -s ${INSTALLATION_DIR}/${OPENOLAT_PACKAGE_NAME_VER} ${INSTALLATION_DIR}/webapp

RUN apk --no-cache add openjdk8 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

COPY ./tomcat-configs/setenv.sh /usr/tomcat/bin/setenv.sh
COPY ./tomcat-configs/server.xml /usr/tomcat/conf/server.xml
COPY ./tomcat-configs/olat.local.properties /usr/tomcat/lib/olat.local.properties
COPY ./tomcat-configs/log4j2.xml /usr/tomcat/lib/log4j2.xml
COPY ./tomcat-configs/ROOT.xml /usr/tomcat/conf/Catalina/localhost/ROOT.xml

EXPOSE 8088

CMD [ "/usr/tomcat/bin/catalina.sh", "run" ]
