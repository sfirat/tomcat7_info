export JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9999 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.password.file=$CATALINA_BASE/conf/jmxremote.password -Dcom.sun.management.jmxremote.access.file=$CATALINA_BASE/conf/jmxremote.access -Dcom.sun.management.jmxremote.ssl=false"
