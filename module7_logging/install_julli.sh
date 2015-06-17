#!/bin/bash
wget -c -q "http://apache.volia.net/tomcat/tomcat-7/v7.0.62/bin/extras/tomcat-juli-adapters.jar" -O /opt/tomcat-juli-adapters.jar
wget -c -q "http://apache.volia.net/tomcat/tomcat-7/v7.0.62/bin/extras/tomcat-juli.jar" -O /opt/tomcat-juli.jar
wget -c -q "http://apache.cp.if.ua/logging/log4j/1.2.17/log4j-1.2.17.tar.gz" -O /opt/log4j-1.2.17.tar.gz
cd /opt && tar zxf log4j-1.2.17.tar.gz && cp apache-log4j-1.2.17/log4j-1.2.17.jar /opt/tomcat7/lib
cp log4j.properties /opt/tomcat7/lib/log4j.properties
mv /opt/tomcat-juli-adapters.jar /opt/tomcat7/lib/ 
mv /opt/tomcat-juli.jar /opt/tomcat7/bin/
mv /opt/tomcat7/conf/logging.properties  /opt/tomcat7/conf/logging.properties.old
