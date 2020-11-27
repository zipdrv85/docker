#!/bin/bash

ORACLE_PWD=$1

su -p oracle -c "$ORACLE_HOME/bin/sqlplus -S / as sysdba << EOF
      ALTER USER SYS IDENTIFIED BY \"$ORACLE_PWD\";
      ALTER USER SYSTEM IDENTIFIED BY \"$ORACLE_PWD\";
      exit;
EOF"

