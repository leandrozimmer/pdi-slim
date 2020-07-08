FROM openjdk:8-jre-alpine3.9

ENV PDIBRANCH=9.0
ENV PDIVERSION=9.0.0.0-423

RUN apk update && apk --no-cache add curl && apk --no-cache add py3-setuptools && pip3 install --upgrade pip && pip3 install awscli && pip3 install requests PyMySQL

RUN  mkdir -p /opt \
 && cd /opt \
 && curl -JLO "https://sourceforge.net/projects/pentaho/files/Pentaho%20$PDIBRANCH/client-tools/pdi-ce-$PDIVERSION.zip/download" \
 && unzip /opt/*.zip -d /opt \
 && rm /opt/*.zip \
 && rm -r /opt/data-integration/ADDITIONAL-FILES \
 && rm -r /opt/data-integration/docs \
 && rm -r /opt/data-integration/samples \
 && rm -r /opt/data-integration/plugins/pentaho-big-data-plugin \
 && rm -r /opt/data-integration/plugins/pentaho-cassandra-plugin \
 && rm -r /opt/data-integration/plugins/pentaho-googledrive-vfs \
 && rm -r /opt/data-integration/plugins/elasticsearch-bulk-insert-plugin

RUN curl -JLO "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.48.tar.gz" \
 && tar -zxvf mysql-connector-java-5.1.48.tar.gz \
 && cp mysql-connector-java-5.1.48/mysql-connector-java-5.1.48-bin.jar /opt/data-integration/lib/ \
 && rm mysql-connector-java-5.1.48.tar.gz \
 && rm -r mysql-connector-java-5.1.48
