#!/bin/bash

# 26 Sep 2019
# Create Jasper Reports PostgreSQL database build script to use as 
# part of the docker build. 

# Default install location for psql on linux/Debian. This location
# may need to be modified if a different version of postgresql
# is being used and/or it is installed in a custom location.
psql="psql"

# Default DB connection values. Source values from environment
# variables configured by the DockerFile. 
# jr-db-name=$JR_DB
BUILD_LOG=$SOLA_HOME/js-build.log
#js-db-name=$JR_DB

# Start the build
echo 
echo 
echo "Starting Jasper Server Build at $(date)"
echo "Starting Jasper Server Build at $(date)" > $BUILD_LOG 2>&1
echo "NOTE: Jasper Reports databases will take approx. 1 minute"
echo "NOTE: Jasper Reports databases will take approx. 1 minute" > $BUILD_LOG 2>&1

# Create database passing in $JR_DB as a variable
echo "Creating Jasper Server database..."
echo "Creating Jasper Server database..." >> $BUILD_LOG 2>&1
$psql --username="$POSTGRES_USER" --file=$SOLA_HOME/jr-database.sql -v dbName=$JR_DB >>$BUILD_LOG 2>&1
# Run the files to create the Jasper Report tables etc, of the database 

echo "Running Jasper Server js-create.ddl..."
echo "### Running Jasper Server js-create.ddl..." >> $BUILD_LOG 2>&1
$psql --username="$POSTGRES_USER" --file=$SOLA_HOME/js-create.ddl $JR_DB > /dev/null 2>> $BUILD_LOG
echo "Running Jasper Server quartz.ddl..."
echo "### Running Jasper Server quartz.ddl..." >> $BUILD_LOG 2>&1
$psql --username="$POSTGRES_USER" --file=$SOLA_HOME/quartz.ddl $JR_DB > /dev/null 2>> $BUILD_LOG
echo "Populating jasperserver database..."
echo "### Populating jasperserver database..." >> $BUILD_LOG 2>&1
$psql --username="$POSTGRES_USER" --file=$SOLA_HOME/sola-jasperserver-data.sql $JR_DB > /dev/null 2>> $BUILD_LOG
# Report the finish time
echo "Finished Jasper Server build at $(date) - Check build.log for errors!"
echo "Finished Jasper Server build at $(date)" >> $BUILD_LOG 2>&1
