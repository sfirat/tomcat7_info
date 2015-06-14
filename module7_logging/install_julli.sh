#!/bin/bash
wget -c -q "http://apache.volia.net/tomcat/tomcat-7/v7.0.61/bin/extras/tomcat-juli-adapters.jar" -O /opt/tomcat-juli-adapters.jar
wget -c -q "http://apache.volia.net/tomcat/tomcat-7/v7.0.61/bin/extras/tomcat-juli.jar" -O /opt/tomcat-juli.jar
mv /opt/tomcat-juli-adapters.jar /opt/tomcat7/lib/ && mv /opt/tomcat-juli.jar /opt/tomcat7/lib/
mv /opt/tomcat7/conf/logging.properties  /opt/tomcat7/conf/logging.properties.old
