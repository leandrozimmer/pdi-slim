FROM openjdk:8u151-jre

ENV PDIBRANCH=9.0
ENV PDIVERSION=9.0.0.0-423

RUN sh -c "cd /opt && curl -JLO https://sourceforge.net/projects/pentaho/files/Pentaho%20$PDIBRANCH/client-tools/pdi-ce-$PDIVERSION.zip/download"
RUN unzip /opt/*.zip -d /opt
RUN rm /opt/*.zip
RUN rm -r /opt/data-integration/ADDITIONAL-FILES
RUN rm -r /opt/data-integration/docs
RUN rm -r /opt/data-integration/samples
RUN rm -r /opt/data-integration/system
RUN rm -r /opt/data-integration/plugins/pentaho-big-data-plugin
RUN rm -r /opt/data-integration/plugins/pentaho-cassandra-plugin
RUN rm -r /opt/data-integration/plugins/pentaho-googledrive-vfs
RUN rm -r /opt/data-integration/plugins/elasticsearch-bulk-insert-plugin

RUN curl -JLO "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.48.tar.gz"
RUN tar -zxvf mysql-connector-java-5.1.48.tar.gz
RUN cp mysql-connector-java-5.1.48/mysql-connector-java-5.1.48-bin.jar /opt/data-integration/lib/
RUN rm mysql-connector-java-5.1.48.tar.gz
RUN rm -r mysql-connector-java-5.1.48
