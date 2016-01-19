CATALINA_OPTS="$CATALINA_OPTS \
-Xmx512m \
-XX:-UseConcMarkSweepGC \
-Dcom.sun.management.jmxremote \
-Dcom.sun.management.jmxremote.authenticate=false \
-Dcom.sun.management.jmxremote.ssl=false \
-Dcom.sun.management.jmxremote.port=9999 \
-Dcom.sun.management.jmxremote.password.file=$CATALINA_BASE/conf/jmxremote.password \
-Dcom.sun.management.jmxremote.access.file=$CATALINA_BASE/conf/jmxremote.access \
-Dcom.sun.management.jmxremote.ssl=false \
-Xloggc:$CATALINA_HOME/logs/gc.log \
-XX:+PrintHeapAtGC \
-XX:+PrintGCDetails \
-XX:+PrintGCTimeStamps \
-XX:-HeapDumpOnOutOfMemoryError \
-Dcom.sun.management.jmxremote.rmi.port=10000 \
-Djava.net.preferIPv4Stack=true \
-Djava.rmi.server.hostname=ec2-52-29-238-104.eu-central-1.compute.amazonaws.com"


