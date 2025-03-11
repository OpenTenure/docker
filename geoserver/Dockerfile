# This is GeoServer image, preloaded with OpenTenure layers, styles and data source.
# While creating data source, it requires DB parameters, which are passed as environment variables,
# except database password, which should be passed as an command argument

FROM tomcat:9-jdk11

MAINTAINER FAO SOLA Team

ENV SOLA_DB sola
ENV DB_HOST db
ENV GEOSERVER_CSRF sola-demo.org

ENV GEOSERVER_VERSION 2.26.2
ENV GEOSERVER_DATA_DIR /var/local/geoserver
ENV GEOSERVER_INSTALL_DIR /usr/local/geoserver
ENV GEOSERVER_EXT_DIR /var/local/geoserver-exts

# Uncomment to use APT cache (requires apt-cacher-ng on host)
#RUN echo "Acquire::http { Proxy \"http://`/sbin/ip route|awk '/default/ { print $3 }'`:3142\"; };" > /etc/apt/apt.conf.d/71-apt-cacher-ng

# Microsoft fonts
#RUN echo "deb http://archive.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
#RUN echo "deb http://archive.debian.org/debian stretch main" >> /etc/apt/sources.list

#RUN set -x \
#	&& apt-get update \
#	&& apt-get install -yq ttf-mscorefonts-installer \
#	&& rm -rf /var/lib/apt/lists/*


ADD .do_deploy_gs /.do_deploy_gs
ADD wait-for-it.sh /wait-for-it.sh
RUN apt-get update \
    && apt-get install unzip

# GeoServer. Demo layers will be deleted
ADD conf/geoserver.xml /usr/local/tomcat/conf/Catalina/localhost/geoserver.xml
RUN mkdir ${GEOSERVER_DATA_DIR} \
    && mkdir ${GEOSERVER_INSTALL_DIR} \
	&& cd ${GEOSERVER_INSTALL_DIR} \
	&& wget http://sourceforge.net/projects/geoserver/files/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-war.zip \
    && unzip geoserver-${GEOSERVER_VERSION}-war.zip \
	&& unzip geoserver.war \
	&& rm -rf geoserver-${GEOSERVER_VERSION}-war.zip geoserver.war target *.txt data/* \
	&& mkdir ${GEOSERVER_INSTALL_DIR}/data/workspaces

# Copy OT layers
COPY opentenure ${GEOSERVER_INSTALL_DIR}/data/workspaces/opentenure

# Enable CORS
RUN sed -i '\:</web-app>:i\
<filter>\n\
    <filter-name>CorsFilter</filter-name>\n\
    <filter-class>org.apache.catalina.filters.CorsFilter</filter-class>\n\
    <init-param>\n\
        <param-name>cors.allowed.origins</param-name>\n\
        <param-value>*</param-value>\n\
    </init-param>\n\
    <init-param>\n\
        <param-name>cors.allowed.methods</param-name>\n\
        <param-value>GET,POST,HEAD,OPTIONS,PUT</param-value>\n\
    </init-param>\n\
</filter>\n\
<filter-mapping>\n\
    <filter-name>CorsFilter</filter-name>\n\
    <url-pattern>/*</url-pattern>\n\
</filter-mapping>\n\
<context-param>\n\
  <param-name>GEOSERVER_CSRF_WHITELIST</param-name>\n\
  <param-value>'"${GEOSERVER_CSRF}"'</param-value>\n\
</context-param>' ${GEOSERVER_INSTALL_DIR}/WEB-INF/web.xml

# Tomcat environment
ENV CATALINA_OPTS "-server -Djava.awt.headless=true \
	-Xms768m -Xmx1560m -XX:+UseConcMarkSweepGC -XX:NewSize=48m \
	-DGEOSERVER_DATA_DIR=${GEOSERVER_DATA_DIR}"

# Create tomcat user to avoid root access. 
RUN addgroup --gid 1099 tomcat && useradd -m -u 1099 -g tomcat tomcat \
    && chown -R tomcat:tomcat . \
    && chown -R tomcat:tomcat ${GEOSERVER_DATA_DIR} \
    && chown -R tomcat:tomcat ${GEOSERVER_INSTALL_DIR}

ADD start.sh /usr/local/bin/start.sh
VOLUME ["${GEOSERVER_DATA_DIR}", "${GEOSERVER_EXT_DIR}"]

ENTRYPOINT [ "/bin/sh", "/usr/local/bin/start.sh"]
CMD [ "sola" ]

EXPOSE 8080