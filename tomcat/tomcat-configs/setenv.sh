CATALINA_HOME=/usr/tomcat
JRE_HOME=/usr/lib/jvm/default-jvm/jre
CATALINA_PID=/run/openolat.pid
CATALINA_TMPDIR=/tmp/openolat
mkdir -p $CATALINA_TMPDIR
 
CATALINA_OPTS="-Xmx1024m -Xms512m -XX:MaxMetaspaceSize=512m  \
-Duser.name=openolat                                   \
-Duser.timezone=Europe/Zurich                          \
-Dspring.profiles.active=myprofile                     \
-Djava.awt.headless=true                               \
-Djava.net.preferIPv4Stack=true                        \
-Djava.endorsed.dirs=./common/endorsed                 \
-XX:+HeapDumpOnOutOfMemoryError                        \
-XX:HeapDumpPath=.                                     \
"
