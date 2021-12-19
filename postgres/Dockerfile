ARG OPENOLAT_PACKAGE_NAME_VER="openolat_1520"

FROM alpine:3

ARG OPENOLAT_PACKAGE_NAME_VER

WORKDIR /tmp

RUN wget --no-check-certificate -q http://www.openolat.org/fileadmin/downloads/releases/${OPENOLAT_PACKAGE_NAME_VER}.war
RUN mkdir -p ${OPENOLAT_PACKAGE_NAME_VER} && \
    unzip -d ${OPENOLAT_PACKAGE_NAME_VER} ${OPENOLAT_PACKAGE_NAME_VER}.war

FROM postgres:9.4

ARG OPENOLAT_PACKAGE_NAME_VER

COPY --from=0 /tmp/${OPENOLAT_PACKAGE_NAME_VER}/WEB-INF/classes/database/postgresql/setupDatabase.sql /tmp/setupDatabase.sql
