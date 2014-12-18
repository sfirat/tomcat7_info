FROM centos
MAINTAINER Vadym Kovalenko vadym.kovalenko@gmail.com

###Declare Env section
ENV LC_ALL C.UTF-8
ENV JAVA_HOME /usr/java/jdk1.7.0_71
#Install needed SW

####Install JDK 1.7 Latest
RUN  wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
     "http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz" -O "/opt/jdk-7u71-linux-x64.tar.gz"


RUN cd /opt && tar zxf jdk-7u71-linux-x64.tar.gz && \
    mkdir /usr/java && rm jdk-7u71-linux-x64.tar.gz && \
    mv /opt/jdk1.7.0_71 /usr/java/ && \
    chown -R root:root /usr/java/ && \
    update-alternatives --install /usr/bin/java java /usr/java/jdk1.7.0_71/jre/bin/java 20000; \
    update-alternatives --install /usr/bin/jar jar /usr/java/jdk1.7.0_71/bin/jar 20000; \
    update-alternatives --install /usr/bin/javac javac /usr/java/jdk1.7.0_71/bin/javac 20000; \
    update-alternatives --install /usr/bin/javaws javaws /usr/java/jdk1.7.0_71/jre/bin/javaws 20000; \
    update-alternatives --set java /usr/java/jdk1.7.0_71/jre/bin/java; \
    update-alternatives --set javaws /usr/java/jdk1.7.0_71/jre/bin/javaws; \
    update-alternatives --set javac /usr/java/jdk1.7.0_71/bin/javac; \
    update-alternatives --set jar /usr/java/jdk1.7.0_71/bin/jar

RUN echo "JAVA_HOME=/usr/java/jdk1.7.0_71" >> /etc/default/tomcat7

RUN wget -c -q "http://apache.volia.net/tomcat/tomcat-7/v7.0.57/bin/apache-tomcat-7.0.57.tar.gz" \
    -O /opt/apache-tomcat-7.0.57.tar.gz

RUN cd /opt && tar zxf apache-tomcat-7.0.57.tar.gz && \
    mv apache-tomcat-7.0.57 tomcat7 && rm apache-tomcat-7.0.57.tar.gz


EXPOSE 8080

ENTRYPOINT ["java","-D[Standalone]","-server","-XX:+UseCompressedOops","-XX:+TieredCompilation","-XX:+DisableExplicitGC","-XX:+UseParallelGC","-XX:ThreadStackSize=256","-Xloggc:/opt/jboss/standalone/log/gc.log","-verbose:gc","-XX:+PrintGCDetails","-XX:+HeapDumpOnOutOfMemoryError","-XX:HeapDumpPath=/opt/jboss/standalone/log/","-Djava.awt.headless=true","-Dsun.rmi.dgc.client.gcInterval=3600000","-Dsun.rmi.dgc.server.gcInterval=3600000","-Dsun.lang.ClassLoader.allowArraySyntax=true","-XX:+CMSPermGenSweepingEnabled","-XX:+CMSClassUnloadingEnabled","-Dorg.jboss.boot.log.file=/opt/jboss/standalone/log/boot.log","-Dlogging.configuration=file:/opt/jboss/standalone/configuration/logging.properties"]

CMD ["-Xms1024m","-Xmx1024m","-XX:PermSize=512m","-XX:MaxPermSize=512m","-Xss4m","-jar","/opt/jboss/jboss-modules.jar","-mp","/opt/jboss/modules","-jaxpmodule","javax.xml.jaxp-provider","org.jboss.as.standalone","-Djboss.home.dir=/opt/jboss"]

