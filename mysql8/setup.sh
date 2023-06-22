#!/bin/bash
set -e

echo 'Starting MySQL...'
service mysql start

mysql < /mysql/privileges.sql
mysql < /mysql/schema.sql
mysql < /mysql/data.sql

# check mysql status
echo `service mysql status`
echo 'MySQL is ready.'

tail -f /dev/null
