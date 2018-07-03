FROM centos
MAINTAINER Vadym Kovalenko vadym.kovalenko@gmail.com

###Declare Env section
ENV LC_ALL C.UTF-8
ENV JAVA_HOME /usr/java/jdk1.7.0_71
#Install needed SW
RUN yum -y install wget tar 
####Install JDK 1.7 Latest
RUN wget --no-cookies \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.tar.gz \
    -O /opt/jdk-8-linux-x64.tar.gz && \
    cd /opt && tar zxf jdk-8-linux-x64.tar.gz && mkdir /usr/java/ && \
    mv /opt/jdk1.8.0_172 /usr/java && \
    rm /opt/jdk-8-linux-x64.tar.gz

#Update alternatives section
RUN update-alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_172/jre/bin/java 20000 && \
    update-alternatives --install /usr/bin/jar jar /usr/java/jdk1.8.0_172/bin/jar 20000 && \
    update-alternatives --install /usr/bin/javac javac /usr/java/jdk1.8.0_172/bin/javac 20000 && \
    update-alternatives --install /usr/bin/javaws javaws /usr/java/jdk1.8.0_172/jre/bin/javaws 20000 && \
    update-alternatives --set java /usr/java/jdk1.8.0_172/jre/bin/java && \
    update-alternatives --set javaws /usr/java/jdk1.8.0_172/jre/bin/javaws && \
    update-alternatives --set javac /usr/java/jdk1.8.0_172/bin/javac && \
    update-alternatives --set jar /usr/java/jdk1.8.0_172/bin/jar 

RUN wget -c -q "http://apache.volia.net/tomcat/tomcat-7/v7.0.88/bin/apache-tomcat-7.0.88.tar.gz" \
    -O /opt/apache-tomcat-7.0.88.tar.gz

RUN cd /opt && tar zxf apache-tomcat-7.0.88.tar.gz && \
    mv apache-tomcat-7.0.88 tomcat7 && rm apache-tomcat-7.0.88.tar.gz

ADD tomcat7_run.sh /usr/bin/tomcat7.run.sh

EXPOSE 8080

CMD ["/usr/bin/tomcat7.run.sh"]
