FROM centos
MAINTAINER Vadym Kovalenko vadym.kovalenko@gmail.com

###Declare Env section
ENV JAVA_HOME /usr/java/jdk1.7.0_71
#Install needed SW
RUN yum -y install httpd httpd-devel tar gcc make wget

RUN wget "http://www.apache.org/dist/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.40-src.tar.gz" -O /usr/src/tomcat-connectors-1.2.40-src.tar.gz

RUN cd /usr/src/ && tar zxf tomcat-connectors-1.2.40-src.tar.gz; \
    cd tomcat-connectors-1.2.40-src/native && ./configure --with-apxs=/usr/bin/apxs ;\
    make && cp apache-2.0/mod_jk.so /etc/httpd/modules/ ;\
    echo "LoadModule jk_module modules/mod_jk.so" >> /etc/httpd/conf.modules.d/00-base.conf;\
    rm /usr/src/tomcat-connectors-1.2.40-src.tar.gz

EXPOSE 80

ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D","FOREGROUND"]
