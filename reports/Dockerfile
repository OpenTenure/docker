# Original image used as prototype is at retriever/jasperserver
#FROM tomcat:7
FROM tomcat:9-jre11

ENV JASPERSERVER_VERSION 8.2.0
ENV BUILDOMATIC_MODE=script

# Execute all in one layer so that it keeps the image as small as possible
#RUN wget "https://sourceforge.net/projects/jasperserver/files/JasperServer/JasperReports%20Server%20Community%20edition%20${JASPERSERVER_VERSION}/TIB_js-jrs-cp_${JASPERSERVER_VERSION}_bin.zip/download" \
RUN apt-get update -y && apt-get install -y unzip && apt install -y git

RUN wget "https://sourceforge.net/projects/jasperserver/files/JasperServer/JasperReports%20Server%20Community%20Edition%208.2.0/TIB_js-jrs-cp_8.2.0_bin.zip/download" \
         -O /tmp/jasperserver.zip  && \
    unzip /tmp/jasperserver.zip -d /usr/src/ && \
    rm /tmp/jasperserver.zip && \
    mv /usr/src/jasperreports-server-cp-${JASPERSERVER_VERSION}-bin /usr/src/jasperreports-server && \
    rm -r /usr/src/jasperreports-server/samples

# Used to wait for the database to start before connecting to it
ADD wait-for-it.sh /wait-for-it.sh

# Used to bootstrap JasperServer the first time it runs and start Tomcat each
ADD entrypoint.sh /entrypoint.sh
ADD .do_deploy_jasperserver /.do_deploy_jasperserver

# Add default OpenTenure reports
ADD reports/reports.zip /reports.zip

#Execute all in one layer so that it keeps the image as small as possible
RUN chmod a+x /entrypoint.sh && \
    chmod a+x /wait-for-it.sh

# This volume allows JasperServer export zip files to be automatically imported when bootstrapping
VOLUME ["/jasperserver-import"]

# By default, JasperReports Server only comes with Postgres & MariaDB drivers
# Copy over other JBDC drivers the deploy-jdbc-jar ant task will put it in right location
ADD drivers/db2jcc4.jar /usr/src/jasperreports-server/buildomatic/conf_source/db/app-srv-jdbc-drivers/db2jcc4.jar
ADD drivers/mysql-connector-java-5.1.44-bin.jar /usr/src/jasperreports-server/buildomatic/conf_source/db/app-srv-jdbc-drivers/mysql-connector-java-5.1.44-bin.jar

# Copy context.xml and adjust server.xml with sola JNDI
ADD ./conf/context.xml /usr/local/tomcat/conf/
RUN sed -i '\:</GlobalNamingResources>:i\
<Resource name="jdbc/sola" \n\
	url="jdbc:postgresql://DB_HOST:DB_PORT/DB_NAME" \n\
	auth="Container" \n\
	type="javax.sql.DataSource" \n\
	factory="org.apache.tomcat.jdbc.pool.DataSourceFactory" \n\
	driverClassName="org.postgresql.Driver" \n\
	username="DB_USER" \n\
	password="DB_PASS" \n\
	maxActive="100" \n\
	maxIdle="10" \n\
	maxWait="-1" \n\
	jdbcInterceptors="org.apache.tomcat.jdbc.pool.interceptor.ResetAbandonedTimer" />' /usr/local/tomcat/conf/server.xml


# Use the minimum recommended settings to start-up
# as per http://community.jaspersoft.com/documentation/jasperreports-server-install-guide/v561/setting-jvm-options-application-servers
ENV JAVA_OPTS="-Xms1024m -Xmx2048m -XX:PermSize=32m -XX:MaxPermSize=512m -Xss2m -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled"

# Wait for DB to start-up, start up JasperServer and bootstrap if required
ENTRYPOINT ["/entrypoint.sh"]
CMD ["sola"]