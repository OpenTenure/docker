# This Dockerflle can be used to build and configure an image of the Payara Application Server 
# for hosting SOLA Community Server. Note that pre-built docker images for the SOLA solutions are 
# available from DockerHub at https://hub.docker.com/u/mcdowella

FROM payara/server-full:5.2022.5

# Database connection parameters
ENV SOLA_DB sola
ENV DB_HOST db
ENV DB_PORT 5432
ENV HTTP_PORT 8080
ENV HTTPS_PORT 8181
ENV ADMIN_PORT 4848

RUN mkdir -p ${PAYARA_DIR}/temp/
COPY libs/ ${PAYARA_DIR}/temp/ 

COPY cs-services.ear /

# Used to bootstrap SOLA Community Server the first time it runs and start Payara server
ADD entrypoint.sh /entrypoint.sh
ADD .do_deploy_cs /.do_deploy_cs
ADD wait-for-it.sh /wait-for-it.sh

USER root

# Set timezone
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
RUN apt-get update && apt-get install -y tzdata

# Copy files required for SOLA into the domain and sets up the file access permissions
RUN mv ${PAYARA_DIR}/temp/jackson* ${PAYARA_DIR}/glassfish/modules/. && \
	mv ${PAYARA_DIR}/temp/postgresql-42* ${PAYARA_DIR}/glassfish/domains/${DOMAIN_NAME}/lib/ && \
	chown -R payara:payara ${PAYARA_DIR}/glassfish/modules/jackson* && \
    chmod 755 ${PAYARA_DIR}/glassfish/modules/jackson* && \
    chown -R payara:payara ${PAYARA_DIR}/glassfish/domains/${DOMAIN_NAME}/lib/*.jar && \
	chmod 755 ${PAYARA_DIR}/glassfish/domains/${DOMAIN_NAME}/lib/*.jar && \
	chown -R payara:payara ${PAYARA_DIR}/glassfish/domains/${DOMAIN_NAME}/config/ && \
	chmod a+x /entrypoint.sh && \
    chmod a+x /wait-for-it.sh

ENTRYPOINT ["/tini", "--", "/entrypoint.sh"]
CMD ["sola"]