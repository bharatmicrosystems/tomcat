# Version JDK8

FROM centos:7
MAINTAINER Gaurav Agarwal, bharatmicrosystems@gmail.com

RUN yum install -y java-1.8.0-openjdk-devel wget git maven

# Create users and groups
RUN groupadd tomcat
RUN mkdir /opt/tomcat
RUN useradd -s /bin/nologin -g tomcat -d /opt/tomcat tomcat

# Download and install tomcat
RUN wget http://www.mirrorservice.org/sites/ftp.apache.org/tomcat/tomcat-8/v8.5.46/bin/apache-tomcat-8.5.46.tar.gz
RUN tar -zxvf apache-tomcat-8.5.46.tar.gz -C /opt/tomcat --strip-components=1
RUN chgrp -R tomcat /opt/tomcat/conf
RUN chmod g+rwx /opt/tomcat/conf
RUN chmod g+r /opt/tomcat/conf/*
RUN chown -R tomcat /opt/tomcat/logs/ /opt/tomcat/temp/ /opt/tomcat/webapps/ /opt/tomcat/work/
RUN chgrp -R tomcat /opt/tomcat/bin
RUN chgrp -R tomcat /opt/tomcat/lib
RUN chmod g+rwx /opt/tomcat/bin
RUN chmod g+r /opt/tomcat/bin/*

RUN ls -ltr /opt/tomcat/webapps/
RUN cd /tmp && git clone https://github.com/DEV3L/java-mvn-hello-world-web-app.git
RUN cd /tmp/java-mvn-hello-world-web-app && mvn clean install
RUN ls -ltr /tmp/java-mvn-hello-world-web-app/target
RUN cp /tmp/java-mvn-hello-world-web-app/target/mvn-hello-world.war /opt/tomcat/webapps/ROOT.war
RUN chmod g+rwx /opt/tomcat/webapps/ROOT.war
RUN ls -ltr /opt/tomcat/webapps/

#VOLUME /opt/tomcat/webapps
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
#
