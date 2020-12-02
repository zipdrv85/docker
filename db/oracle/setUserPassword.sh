#!/bin/bash

ORACLE_ID=$1
ORACLE_PWD=$2

su -p oracle -c "$ORACLE_HOME/bin/sqlplus -S / as sysdba << EOF
      SELECT $ORACLE_PWD FROM DUAL;
      ALTER USER $ORACLE_ID IDENTIFIED BY \"$ORACLE_PWD\";
      exit;
EOF"

echo "ALTER USER $ORACLE_ID IDENTIFIED BY $ORACLE_PWD"
