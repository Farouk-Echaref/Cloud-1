#!/bin/sh

service mysql start

mysql -u root -p$DB_ROOT_PASS -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

mysql -u root -p$DB_ROOT_PASS -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASS';"

# mysql -u root -p$DB_ROOT_PASS -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASS';"

mysql -u root -p$DB_ROOT_PASS -e "FLUSH PRIVILEGES;"

mysql -u root -p$DB_ROOT_PASS -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';"

mysql -u root -p$DB_ROOT_PASS -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';"

mysql -u root -p$DB_ROOT_PASS -e "FLUSH PRIVILEGES;"

kill `cat /var/run/mysqld/mysqld.pid`