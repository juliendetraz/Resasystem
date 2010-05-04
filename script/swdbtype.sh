#!/bin/bash
cd `dirname $0`/../config/

if [ "$1" == "sqlite" ]
then
    cp database.sqlite3.yml database.yml
elif [ "$1" == "mysql" ]
then
    cp database.mysql.yml database.yml
elif [ "$1" == "pgsql" ]
then
    cp database.pgsql.yml database.yml
elif [ "$1" == "" ]
then
    echo "USAGE: $0 sqlite | mysql | pgsql"
fi