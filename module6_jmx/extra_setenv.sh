-Dcom.sun.management.jmxremote.password.file=$CATALINA_BASE/conf/jmxremote.password
-Dcom.sun.management.jmxremote.access.file=$CATALINA_BASE/conf/jmxremote.access
-Dcom.sun.management.jmxremote.ssl=false
-Xloggc:$CATALINA_HOME/logs/gc.log
-XX:+PrintHeapAtGC
-XX:+PrintGCDetails
-XX:+PrintGCTimeStamps
-XX:-HeapDumpOnOutOfMemoryError

