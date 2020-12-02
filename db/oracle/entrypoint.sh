#!/bin/bash

# Prevent owner issues on mounted folders
chown -R oracle:dba /u01/app/oracle
rm -f /u01/app/oracle/product
ln -s /u01/app/oracle-product /u01/app/oracle/product

export CHARACTER_SET="AL32UTF8"
echo "CHARACTER_SET=AL32UTF8"

if [ -z "$CHARACTER_SET" ]; then
	if [ "${USE_UTF8_IF_CHARSET_EMPTY}" == "true" ]; then
		export CHARACTER_SET="AL32UTF8"
		#export CHARACTER_SET="KO16MSWIN949"
		#echo "CHARACTER_SET=KO16MSWIN949"
	fi
fi

if [ -n "$CHARACTER_SET" ]; then
	export CHARSET_MOD="NLS_LANG=.$CHARACTER_SET"
	export CHARSET_INIT="-characterSet $CHARACTER_SET"
	echo "CHARSET_INIT=-characterSet $CHARACTER_SET"
fi

# Update hostname
sed -i -E "s/HOST = [^)]+/HOST = $HOSTNAME/g" /u01/app/oracle/product/11.2.0/xe/network/admin/listener.ora
sed -i -E "s/PORT = [^)]+/PORT = 1521/g" /u01/app/oracle/product/11.2.0/xe/network/admin/listener.ora
echo "export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe" > /etc/profile.d/oracle-xe.sh
echo "export PATH=\$ORACLE_HOME/bin:\$PATH" >> /etc/profile.d/oracle-xe.sh
echo "export ORACLE_SID=XE" >> /etc/profile.d/oracle-xe.sh
. /etc/profile

case "$1" in
	'')
		#Check for mounted database files
		if [ "$(ls -A /u01/app/oracle/oradata)" ]; then
			echo "Custom found files in /u01/app/oracle/oradata Using them instead of initial database"
			echo "XE:$ORACLE_HOME:N" >> /etc/oratab
			chown oracle:dba /etc/oratab
			chown 664 /etc/oratab
			printf "ORACLE_DBENABLED=false\nLISTENER_PORT=1521\nHTTP_PORT=8080\nCONFIGURE_RUN=true\n" > /etc/default/oracle-xe
			rm -rf /u01/app/oracle-product/11.2.0/xe/dbs
			ln -s /u01/app/oracle/dbs /u01/app/oracle-product/11.2.0/xe/dbs
		else
			echo "Custom Database not initialized. Initializing database."
			export IMPORT_FROM_VOLUME=true

			printf "Setting up:\nprocesses=$processes\nsessions=$sessions\ntransactions=$transactions\n"
			echo "If you want to use different parameters set processes, sessions, transactions env variables and consider this formula:"
			printf "processes=x\nsessions=x*1.1+5\ntransactions=sessions*1.1\n"

			mv /u01/app/oracle-product/11.2.0/xe/dbs /u01/app/oracle/dbs
			ln -s /u01/app/oracle/dbs /u01/app/oracle-product/11.2.0/xe/dbs

			#Setting up processes, sessions, transactions.
			echo "Setting up processes, sessions, transactions."
			sed -i -E "s/processes=[^)]+/processes=$processes/g" /u01/app/oracle/product/11.2.0/xe/config/scripts/init.ora
			sed -i -E "s/processes=[^)]+/processes=$processes/g" /u01/app/oracle/product/11.2.0/xe/config/scripts/initXETemp.ora
			
			sed -i -E "s/sessions=[^)]+/sessions=$sessions/g" /u01/app/oracle/product/11.2.0/xe/config/scripts/init.ora
			sed -i -E "s/sessions=[^)]+/sessions=$sessions/g" /u01/app/oracle/product/11.2.0/xe/config/scripts/initXETemp.ora

			sed -i -E "s/transactions=[^)]+/transactions=$transactions/g" /u01/app/oracle/product/11.2.0/xe/config/scripts/init.ora
			sed -i -E "s/transactions=[^)]+/transactions=$transactions/g" /u01/app/oracle/product/11.2.0/xe/config/scripts/initXETemp.ora

			printf 8080\\n1521\\noracle\\noracle\\ny\\n | /etc/init.d/oracle-xe configure

			echo "Database initialized. Please visit http://#containeer:8080/apex to proceed with configuration"
		fi

		/etc/init.d/oracle-xe start
                
                echo "oracle password settings ================================================================== $syspassword"
                /setPassword.sh $JDBC_PASSWORD 
		
		if [ $IMPORT_FROM_VOLUME ]; then
			echo "Starting import from '/docker-entrypoint-initdb.d':"

			for f in $(ls /docker-entrypoint-initdb.d/*); do
				echo "found file $f"
				case "$f" in
					*.sh)     echo "[IMPORT] $0: running $f"; . "$f" ;;
					*.sql)    echo "[IMPORT] $0: running $f"; echo "exit" | su oracle -c "$CHARSET_MOD $ORACLE_HOME/bin/sqlplus -S / as sysdba @$f"; echo ;;
					*.dmp)    echo "[IMPORT] $0: running $f"; impdp $f ;;
					*)        echo "[IMPORT] $0: ignoring $f" ;;
				esac
				echo
			done

			echo "Import finished"
			echo
		else
			echo "[IMPORT] Not a first start, SKIPPING Import from Volume '/docker-entrypoint-initdb.d'"
			echo "[IMPORT] If you want to enable import at any state - add 'IMPORT_FROM_VOLUME=true' variable"
			echo
		fi

                echo "oracle user password settings ================================================================== $JDBC_USERNAME"
                echo "oracle user password settings ================================================================== $JDBC_PASSWORD"
                /setUserPassword.sh $JDBC_USERNAME '$JDBC_PASSWORD'

		echo "Database ready to use. Enjoy! ;)"

		##
		## Workaround for graceful shutdown. ....ing oracle... ‿( ́ ̵ _-`)‿
		##
		while [ "$END" == '' ]; do
			sleep 1
			trap "/etc/init.d/oracle-xe stop && END=1" INT TERM
		done
		;;

	*)
		echo "Database is not configured. Please run /etc/init.d/oracle-xe configure if needed."
		$1
		;;
esac
# exit

