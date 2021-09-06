#!/bin/bash

case "$1" in
    'start')  # Start docker oracle & postgres
	echo "Starting Docker OracleHA & postgres Service...: "
	
	docker-compose -f ../composeLocal/docker-compose-db.yml up --build -d
	
	RVAL=$?
	echo $RVAL
	exit $RVAL
	    ;;
		
    'stop')   # Stop docker oracle & postgres
	echo "Stop Docker OracleHA & postgres Service...: "
	
	docker-compose -f ../composeLocal/docker-compose-db.yml down
	
	exit $RVAL
	;;
	
    'restart')   # Stop docker oracle & postgres
	echo "Restarting Docker OracleHA & postgres Service...: "

	#docker-compose -f ../composeLocal/docker-compose-db.yml restart -d
	docker-compose -f ../composeLocal/docker-compose-db.yml down
	
        docker-compose -f ../composeLocal/docker-compose-db.yml up --build -d

	RVAL=$?
	echo $RVAL
	exit $RVAL
	;;
esac
