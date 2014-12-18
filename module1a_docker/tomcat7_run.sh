#!/bin/bash

/opt/tomcat/bin/startup
exec tail -f /var/log/tomcat7/catalina.out
