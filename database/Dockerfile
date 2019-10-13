# This Dockerflle can be used to build and configure images for the SOLA database
# based on a Postgres PostGIS image and Jasper Reports PG database image
# Before building an image, you must manually unzip 
# the database build files in the appropriate Solution/Version folder. Note that  
# pre-built docker images for the SOLA solutions are available from DockerHub at 
# https://hub.docker.com/u/mcdowella & ttps://hub.docker.com/u/npullar and 
# http://community.jaspersoft.com/project/jasperreports-server/releases 
# (JasperReports Community Edition (CE) version currently using version 6.3.0)

FROM mdillon/postgis:11

ENV SOLA_HOME /home/sola

# Used by create_database.sh to set the name of the SOLA database 
ENV SOLA_DB sola

# Used by create_database.sh to determine if the SOLA DB should be created
ENV CREATE_SOLA_DB y

# Used by create_database.sh to control if data is loaded into the 
# new database
ENV SOLA_LOAD_DATA y

# Used by create_jasperreports-db.sh to set the name of the Jasper Reports database 
# ENV JR_DB jasperserver

# Change this to modify which SOLA solution database and version is built. 
# Can also specify solution at build time from build command line. See --build-arg option. 
#ARG SOLA_SOLUTION=registry/1503a
#ARG SOLA_SOLUTION=stateland/1503a
#ARG SOLA_SOLUTION=systemreg/1503a
#ARG SOLA_SOLUTION=community/1805a
ARG SOLA_SOLUTION=community/1910a
# ARG JS_SOLUTION=jasperreports/buildomatic/install_resources/sql/postgresql
# ARG JS_SOLUTION=jasperreports

RUN mkdir -p ${SOLA_HOME}

# Copies the database build files from source directories into the image
COPY common/ ${SOLA_SOLUTION}/ ${SOLA_HOME}/

# Need to copy two files from the jasperreports-server-cp-6.3.0-bin.zip download
# from http://community.jaspersoft.com/project/jasperreports-server/releases
# Specifically these two files from the sub-folder /buildomatic/install_resources/sql/postgresql
# Initial implementation uses Jasper Reports CE version 6.3.0
# COPY ${JS_SOLUTION}/js-create.ddl ${SOLA_HOME}/
# COPY ${JS_SOLUTION}/quartz.ddl ${SOLA_HOME}/
# PSQL file that creates jasperserver PostgreSQL database using these two files
# COPY ${JS_SOLUTION}/create_js_database.sh ${SOLA_HOME}/

# See postgres docker image documentation. Files in docker-entrypoint-initdb.d
# will be run as part of the postgres init process. 
# The commands below remove any files in the init directory and add the 
# create_database.sh to ensure the sola database is created on the first run
# of the docker image. Also sets permissions to allow the build.log to be written
# to SOLA_HOME.  
RUN mv /docker-entrypoint-initdb.d/*.sh ${SOLA_HOME}/. && \
   cp ${SOLA_HOME}/create_database.sh /docker-entrypoint-initdb.d/10.create_database.sh  && \
   chmod 755 /docker-entrypoint-initdb.d/10.create_database.sh && \
    chmod 777 ${SOLA_HOME}
    
# Now add the Jasper Reports creating script to init directory to be run second
#RUN cp ${SOLA_HOME}/create_js_database.sh /docker-entrypoint-initdb.d/20.create_js_database.sh  && \
#   chmod 755 /docker-entrypoint-initdb.d/20.create_js_database.sh && \
#    chmod 777 ${SOLA_HOME}

    


