#!/bin/bash

# wait for the database to start before connecting

/wait-for-it.sh $DB_HOST:$DB_PORT -t 90

PAYARA_DOMAIN=domain1

# check if we need to bootstrap Community Server
if [ -f "/.do_deploy_cs" ]; then
	
	# RUN completes the following tasks:
	# 1. Creates a command file to configure the SOLA domain to support deployment of the SOLA Community Server application. 
	# 2. Creates password file to access Payara. Assumes default password has been set to admin. 
	#    Check the payara/server-full image for password changes.
	# 3. Creates a custom post boot deploy commands that will deploy the SOLA Community Server application 
	#    the first time the Payara image is run. Uses POSTBOOT_COMMANDS environment variable setup by 
	#    the payara/server-full image.
	# 4. Configures the domain for SOLA deployment using the admin command file (created in step 1) - 
	#    but does not deploy the applications. Deploying the apps is performed when the image is 
	#    run to create a container.
	DATABASE_USER=postgres
	DATABASE_PASS=$1
	DATAPOOL=sola
	PAYARA_PASSWD=admin
	CS_SERVICES_EAR=cs-services
	
	CMD_FILE=${PAYARA_DIR}/temp/asadmin-command-file
		
	echo "create-jdbc-connection-pool --validateAtmostOncePeriodInSeconds=0 --sqlTraceListeners=fish.payara.jdbc.SilentSqlTraceListener --statementLeakReclaim=false --ping=false --maxWaitTimeInMillis=60000 --wrapJdbcObjects=true --connectionValidationMethod=table --steadyPoolSize=8 --idleTimeoutInSeconds=300 --maxConnectionUsageCount=0 --matchConnections=false --connectionCreationRetryIntervalInSeconds=10 --associateWithThread=false --isConnectionValidationRequired=false --connectionLeakReclaim=false --datasourceClassname=org.postgresql.ds.PGConnectionPoolDataSource --connectionCreationRetryAttempts=0 --statementCacheSize=0 --resType=javax.sql.ConnectionPoolDataSource --statementLeakTimeoutInSeconds=0 --failAllConnections=false --statementTimeoutInSeconds=-1 --lazyConnectionEnlistment=false --pooling=true --poolResizeQuantity=2 --allowNonComponentCallers=false --connectionLeakTimeoutInSeconds=0 --isIsolationLevelGuaranteed=true --maxPoolSize=32 --nonTransactionalConnections=false --lazyConnectionAssociation=false ${DATAPOOL}" > "$CMD_FILE"
	echo "set resources.jdbc-connection-pool.${DATAPOOL}.property.TargetServerType=any resources.jdbc-connection-pool.${DATAPOOL}.property.BinaryTransfer=true resources.jdbc-connection-pool.${DATAPOOL}.property.UnknownLength=2147483647 resources.jdbc-connection-pool.${DATAPOOL}.property.DisableColumnSanitiser=false resources.jdbc-connection-pool.${DATAPOOL}.property.UseSpNego=false resources.jdbc-connection-pool.${DATAPOOL}.property.SspiServiceClass=POSTGRES resources.jdbc-connection-pool.${DATAPOOL}.property.ProtocolVersion=0 resources.jdbc-connection-pool.${DATAPOOL}.property.SendBufferSize=-1 resources.jdbc-connection-pool.${DATAPOOL}.property.ReceiveBufferSize=-1 resources.jdbc-connection-pool.${DATAPOOL}.property.LoadBalanceHosts=false resources.jdbc-connection-pool.${DATAPOOL}.property.ReadOnly=false resources.jdbc-connection-pool.${DATAPOOL}.property.LogUnclosedConnections=false resources.jdbc-connection-pool.${DATAPOOL}.property.DatabaseName=${SOLA_DB} resources.jdbc-connection-pool.${DATAPOOL}.property.GssLib=auto resources.jdbc-connection-pool.${DATAPOOL}.property.CancelSignalTimeout=10 resources.jdbc-connection-pool.${DATAPOOL}.property.PortNumber=${DB_PORT} resources.jdbc-connection-pool.${DATAPOOL}.property.DefaultRowFetchSize=0 resources.jdbc-connection-pool.${DATAPOOL}.property.User=${DATABASE_USER} resources.jdbc-connection-pool.${DATAPOOL}.property.DatabaseMetadataCacheFieldsMiB=5 resources.jdbc-connection-pool.${DATAPOOL}.property.URL=jdbc:postgresql://${DB_HOST}:${DB_PORT}/${SOLA_DB} resources.jdbc-connection-pool.${DATAPOOL}.property.Url=jdbc:postgresql://${DB_HOST}:${DB_PORT}/${SOLA_DB} resources.jdbc-connection-pool.${DATAPOOL}.property.AllowEncodingChanges=false resources.jdbc-connection-pool.${DATAPOOL}.property.JaasLogin=true resources.jdbc-connection-pool.${DATAPOOL}.property.PrepareThreshold=5 resources.jdbc-connection-pool.${DATAPOOL}.property.ReWriteBatchedInserts=false resources.jdbc-connection-pool.${DATAPOOL}.property.SocketTimeout=0 resources.jdbc-connection-pool.${DATAPOOL}.property.HostRecheckSeconds=10 resources.jdbc-connection-pool.${DATAPOOL}.property.Password=${DATABASE_PASS} resources.jdbc-connection-pool.${DATAPOOL}.property.ConnectTimeout=10 resources.jdbc-connection-pool.${DATAPOOL}.property.ApplicationName='PostgreSQL JDBC Driver' resources.jdbc-connection-pool.${DATAPOOL}.property.PreparedStatementCacheQueries=256 resources.jdbc-connection-pool.${DATAPOOL}.property.Ssl=false resources.jdbc-connection-pool.${DATAPOOL}.property.PreparedStatementCacheSizeMiB=5 resources.jdbc-connection-pool.${DATAPOOL}.property.LoginTimeout=0 resources.jdbc-connection-pool.${DATAPOOL}.property.ServerName=${DB_HOST} resources.jdbc-connection-pool.${DATAPOOL}.property.DatabaseMetadataCacheFields=65536 resources.jdbc-connection-pool.${DATAPOOL}.property.TcpKeepAlive=false" >> "$CMD_FILE"
	echo "create-jdbc-resource --enabled=true --poolName=${DATAPOOL} --target=domain jdbc/${DATAPOOL}" >> "$CMD_FILE"
	echo "create-resource-ref --enabled=true --target=server jdbc/${DATAPOOL}" >> "$CMD_FILE"
	echo "create-auth-realm --classname=com.sun.enterprise.security.auth.realm.jdbc.JDBCRealm --property=jaas-context=jdbcRealm:datasource-jndi=jdbc/${DATAPOOL}:user-table=system.active_users:user-name-column=username:password-column=passwd:group-table=system.user_roles:group-name-column=rolename: --target=server-config SolaRealm" >> "$CMD_FILE"
	echo "delete-jvm-options -- -client" >> "$CMD_FILE"
	echo "set-log-levels --target=server-config org.sola.services=INFO:java.sql.ResultSet=OFF:java.sql.Connection=FINE:java.sql=FINE" >> "$CMD_FILE"
	
	${PAYARA_DIR}/bin/asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} start-domain ${DOMAIN_NAME} 
	${PAYARA_DIR}/bin/asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} multimode --file ${PAYARA_DIR}/temp/asadmin-command-file 
	${PAYARA_DIR}/bin/asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} deploy --name=${CS_SERVICES_EAR} /${CS_SERVICES_EAR}.ear
	${PAYARA_DIR}/bin/asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} set configs.config.server-config.network-config.network-listeners.network-listener.http-listener-1.port=${HTTP_PORT}
	${PAYARA_DIR}/bin/asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} set configs.config.server-config.network-config.network-listeners.network-listener.http-listener-2.port=${HTTPS_PORT}
	${PAYARA_DIR}/bin/asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} set configs.config.server-config.network-config.network-listeners.network-listener.admin-listener.port=${ADMIN_PORT}
	${PAYARA_DIR}/bin/asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} stop-domain ${DOMAIN_NAME} 
	
	# Kill ports as they hang up sometimes
	fuser -k 4848/tcp
	fuser -k 8080/tcp
	fuser -k 8181/tcp
	fuser -k ${HTTP_PORT}/tcp
	fuser -k ${HTTPS_PORT}/tcp
	fuser -k ${ADMIN_PORT}/tcp
	
	# Clean up
	unset PAYARA_PASSWD
	unset DATABASE_PASS
	rm -rf ${PAYARA_DIR}/glassfish/domains/${DOMAIN_NAME}/osgi-cache
	rm -rf ${PAYARA_DIR}/glassfish/domains/${DOMAIN_NAME}/logs
	rm -Rf ${PAYARA_DIR}/temp
	rm /.do_deploy_cs

fi

${SCRIPT_DIR}/entrypoint.sh

