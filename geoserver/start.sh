#!/bin/bash

# Wait for database server to start up
/wait-for-it.sh $DB_HOST:5432 -t 90

if [ -n "${CUSTOM_UID}" ];then
  echo "Using custom UID ${CUSTOM_UID}."
  usermod -u ${CUSTOM_UID} tomcat
  find / -user 1099 -exec chown -h tomcat {} \; 
fi

if [ -n "${CUSTOM_GID}" ];then
  echo "Using custom GID ${CUSTOM_GID}."
  groupmod -g ${CUSTOM_GID} tomcat
  find / -group 1099 -exec chgrp -h tomcat {} \;
fi

#We need this line to ensure that data has the correct rights
chown -R tomcat:tomcat ${GEOSERVER_DATA_DIR} 
chown -R tomcat:tomcat ${GEOSERVER_EXT_DIR}

for ext in `ls -d "${GEOSERVER_EXT_DIR}"/*/`; do
  su tomcat -c "cp "${ext}"*.jar /usr/local/geoserver/WEB-INF/lib"
done

# Now we copy data, after data volume is created in the dockerfile and OT folder doesn't exist
if [ ! -d "${GEOSERVER_DATA_DIR}/workspaces/opentenure" ]; then
	# As this is the first start, OpenTenure DB may not be created yet. Let's wait another 10 seconds
	sleep 40
	
    mv $GEOSERVER_INSTALL_DIR/data/* ${GEOSERVER_DATA_DIR}

	# Configure PostGIS store to connect to OT database
	sed -i -e "s|DB_HOST|$DB_HOST|g;s|SOLA_DB|$SOLA_DB|g;s|DB_PASSWORD|$1|g" ${GEOSERVER_DATA_DIR}/workspaces/opentenure/opentenure/datastore.xml
	unset $1
fi

# check if we need to bootstrap Geoserver
if [ -f "/.do_deploy_gs" ]; then
	sed -i -e "s|sola-demo.org|$GEOSERVER_CSRF|g;" ${GEOSERVER_INSTALL_DIR}/WEB-INF/web.xml
	rm /.do_deploy_gs
fi

su tomcat -c "/usr/local/tomcat/bin/catalina.sh run"
