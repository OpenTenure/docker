# This Dockerflle can be used to build and configure images for the SOLA OpenTenure database based on a Postgres PostGIS image.

#FROM mdillon/postgis:11
FROM postgis/postgis:16-master

ENV SOLA_HOME /home/sola

# Used by create_database.sh to set the name of the SOLA database 
ENV SOLA_DB sola
RUN mkdir -p ${SOLA_HOME}

# Copies the database build files from source directories into the image
COPY scripts/ ${SOLA_HOME}/

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