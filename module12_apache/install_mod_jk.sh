#!/bin/bash
yum -y install httpd httpd-devel tar gcc make wget
chkconfig --levels 235 httpd on
wget -q "http://www.apache.org/dist/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.40-src.tar.gz" -O /usr/src/tomcat-connectors-1.2.40-src.tar.gz

cd /usr/src/ && tar zxf tomcat-connectors-1.2.40-src.tar.gz; \
    cd tomcat-connectors-1.2.40-src/native && ./configure --with-apxs=/usr/bin/apxs ;\
    make && cp apache-2.0/mod_jk.so /etc/httpd/modules/ ;\
    echo "LoadModule jk_module modules/mod_jk.so" >> /etc/httpd/conf.modules.d/00-base.conf;\
    rm /usr/src/tomcat-connectors-1.2.40-src.tar.gz
#cp 00-jk.conf /etc/httpd/conf.modules.d/00-jk.conf 
#cp worker.properties /etc/httpd/conf/
