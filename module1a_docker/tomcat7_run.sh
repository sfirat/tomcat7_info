#!/bin/bash

/opt/tomcat7/bin/catalina.sh run
exec tail -f /opt/tomcat7/log/catalina.out
