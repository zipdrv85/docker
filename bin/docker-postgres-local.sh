#!/bin/bash

case "$1" in
    'start')  # Start docker postgres
	echo "Starting Docker PostgresHA Service...: "
	
	docker-compose -f ../composeLocal/docker-compose-postgres.yml up --build -d
	
	RVAL=$?
	echo $RVAL
	exit $RVAL
	    ;;
		
    'stop')   # Stop docker postgres
	echo "Stop Docker PostgresHA Service...: "
	
	docker-compose -f ../composeLocal/docker-compose-postgres.yml down
	
	exit $RVAL
	;;
	
    'restart')   # Stop docker postgres
	echo "Restarting Docker PostgresHA Service...: "

	docker-compose -f ../composeLocal/docker-compose-postgres.yml restart -d

	RVAL=$?
	echo $RVAL
	exit $RVAL
	;;
esac
