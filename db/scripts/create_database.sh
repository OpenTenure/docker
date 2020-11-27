#!/bin/bash

# 18 Nov 2020
# Customized version of the SOLA database build script to use as 
# part of the docker build. 

# Default install location for psql on linux/Debian. This location
# may need to be modified if a different version of postgresql
# is being used and/or it is installed in a custom location.
psql="psql"

# Create database only if it doesn't exist
if [ "$( psql -tAc "SELECT 1 FROM pg_database WHERE datname='$SOLA_DB'" )" != '1' ]
then
   BUILD_LOG=$SOLA_HOME/build.log

	# Start the build
	echo 
	echo 
	echo "Starting Build at $(date)"
	echo "Starting Build at $(date)" > $BUILD_LOG 2>&1
	echo "NOTE: Build of SOLA database will take approx. 1 minute"
	echo "NOTE: Build of SOLA database will take approx. 1 minute" > $BUILD_LOG 2>&1

	# Create database passing in $SOLA_DB as a variable
	echo "Creating database..."
	echo "Creating database..." >> $BUILD_LOG 2>&1
	$psql --username="$POSTGRES_USER" --file=$SOLA_HOME/database.sql -v dbName=$SOLA_DB >>$BUILD_LOG 2>&1

	# Run the files to create the tables, functions and views, etc, of the database
	# and load the configuration data from the config directory. 
	for sqlfile in $SOLA_HOME/schema/*.sql $SOLA_HOME/config/*.sql
	do
	   echo "Running $sqlfile..."
	   echo "### Running $sqlfile..." >> $BUILD_LOG 2>&1
	   $psql --username="$POSTGRES_USER" --file="$sqlfile" $SOLA_DB > /dev/null 2>> $BUILD_LOG
	done

	# Run any override settings for docker deployment
	echo "Running docker_config.sql..."
	echo "### Running docker_config.sql..." >> $BUILD_LOG 2>&1
	$psql --username="$POSTGRES_USER" --file=$SOLA_HOME/docker_config.sql $SOLA_DB > /dev/null 2>> $BUILD_LOG

	# Update claims map layer to point to configured GeoServer parameters
	psql -v ON_ERROR_STOP=1 -v v1="'$HOST_IP_OR_NAME'" -v v2="'$GEOSERVER_PORT'" -v v3="'$CS_HTTP_PORT'" --username postgres --dbname "$SOLA_DB" <<-EOSQL
		update system.config_map_layer set url='http://' || :v1 || ':' || :v2 || '/geoserver/opentenure/wms' where name = 'claims-orthophoto';
		update system.setting set vl = 'http://cs:' || :v3 where name = 'cs_server_url';
	EOSQL

	# Report the finish time
	echo "Finished at $(date) - Check build.log for errors!"
	echo "Finished at $(date)" >> $BUILD_LOG 2>&1
fi


