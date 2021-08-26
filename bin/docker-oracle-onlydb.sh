#!/bin/bash

case "$1" in
    'start')  # Start docker oracle
	echo "Starting Docker OracleHA Service...: "
	
	docker-compose -f ../composeLocal/docker-compose-oracle.yml up --build -d
	
	RVAL=$?
	echo $RVAL
	exit $RVAL
	    ;;
		
    'stop')   # Stop docker oracle
	echo "Stop Docker OracleHA Service...: "
	
	docker-compose -f ../composeLocal/docker-compose-oracle.yml down
	
	exit $RVAL
	;;
	
    'restart')   # Stop docker oracle
	echo "Restarting Docker OracleHA Service...: "

	docker-compose -f ../composeLocal/docker-compose-oracle.yml restart -d

	RVAL=$?
	echo $RVAL
	exit $RVAL
	;;
esac
