#!/bin/bash
wget -c -q "http://apache.ip-connect.vn.ua/tomcat/tomcat-7/v7.0.67/bin/extras/catalina-jmx-remote.jar" -O /opt/catalina-jmx-remote.jar
mv /opt/catalina-jmx-remote.jar /opt/tomcat7/lib
