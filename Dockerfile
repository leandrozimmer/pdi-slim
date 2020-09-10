FROM leandrozimmer/pdi-slim:latest

RUN curl -JLO "https://github.com/leandrozimmer/pdi-slim/raw/sqljdbc41/jars/sqljdbc41.jar" \
 && cp sqljdbc41.jar /opt/data-integration/lib/ \
 && rm sqljdbc41.jar
