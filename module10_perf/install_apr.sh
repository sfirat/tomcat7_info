#!/bin/bash
yum install -y apr-devel.x86_64 make gcc apr-devel.x86_64 openssl.x86_64 openssl-devel.x86_64
cd /opt/tomcat7/bin/
tar xf tomcat-native.tar.gz
cd tomcat-native-1.1.33-src/jni/native
./configure --with-apr=/usr/bin/apr-1-config --with-java-home=/usr/java/jdk1.7.0_71 --with-ssl && make && make install
echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/apr/lib"' >> /opt/tomcat7/bin/setenv.sh
cd /opt/tomcat7/bin && rm -rf tomcat-native-1.1.33-src
