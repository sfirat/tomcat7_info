#!/bin/bash
rm -rf /usr/java
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz" -O "/opt/jdk-7u71-linux-x64.tar.gz"
cd /opt && tar zxf jdk-7u71-linux-x64.tar.gz && mkdir /usr/java/ && mv /opt/jdk1.7.0_71 /usr/java && rm /opt/jdk-7u71-linux-x64.tar.gz
#Update alternatives section
alternatives --install /usr/bin/java java /usr/java/jdk1.7.0_71/jre/bin/java 20000
alternatives --install /usr/bin/jar jar /usr/java/jdk1.7.0_71/bin/jar 20000
alternatives --install /usr/bin/javac javac /usr/java/jdk1.7.0_71/bin/javac 20000
alternatives --install /usr/bin/javaws javaws /usr/java/jdk1.7.0_71/jre/bin/javaws 20000
alternatives --set java /usr/java/jdk1.7.0_71/jre/bin/java
alternatives --set javaws /usr/java/jdk1.7.0_71/jre/bin/javaws
alternatives --set javac /usr/java/jdk1.7.0_71/bin/javac
alternatives --set jar /usr/java/jdk1.7.0_71/bin/jar
#check version
java -version
