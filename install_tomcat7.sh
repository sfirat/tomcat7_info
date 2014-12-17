#!/bin/bash

wget -c -q "http://apache.volia.net/tomcat/tomcat-7/v7.0.57/bin/apache-tomcat-7.0.57.tar.gz" -O /opt/apache-tomcat-7.0.57.tar.gz
#wget -c -q "http://apache.volia.net/tomcat/tomcat-7/v7.0.57/src/apache-tomcat-7.0.57-src.tar.gz" -O /opt/apache-tomcat-7.0.57-src.tar.gz
#wget -c -q "http://apache.volia.net/ant/binaries/apache-ant-1.9.4-bin.tar.gz" -O /opt/apache-ant-1.9.4-bin.tar.gz 
#ln -s /opt/apache-ant-1.9.4 /opt/ant 
#echo ANT_HOME=/opt/ant >> /etc/environment
#ln -s /opt/ant/bin/ant /usr/bin/ant 
cd /otp && tar zxf apache-tomcat-7.0.57.tar.gz && mv apache-tomcat-7.0.57 tomcat7 && rm apache-tomcat-7.0.57.tar.gz
