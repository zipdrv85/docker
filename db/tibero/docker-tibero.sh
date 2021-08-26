#!/bin/bash

case "$1" in
    'start')  # Start docker oracle & postgres
	echo "Starting Docker OracleHA & postgres Service...: "
	
	docker-compose -f docker-compose-tibero.yml up --build -d
	
	RVAL=$?
	echo $RVAL
	exit $RVAL
	    ;;
		
    'stop')   # Stop docker oracle & postgres
	echo "Stop Docker OracleHA & postgres Service...: "
	
	docker-compose -f docker-compose-tibero.yml down
	
	exit $RVAL
	;;
	
    'restart')   # Stop docker oracle & postgres
	echo "Restarting Docker OracleHA & postgres Service...: "

	docker-compose -f docker-compose-tibero.yml restart -d

	RVAL=$?
	echo $RVAL
	exit $RVAL
	;;
esac
