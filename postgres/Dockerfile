FROM busybox

WORKDIR /tmp

RUN wget --no-check-certificate -q http://www.openolat.org/fileadmin/downloads/releases/openolat_1520.war
RUN mkdir -p openolat_1520 && \
    unzip -d openolat_1520 openolat_1520.war 

FROM postgres:9.4

COPY --from=0 /tmp/openolat_1520/WEB-INF/classes/database/postgresql/setupDatabase.sql /tmp/setupDatabase.sql
