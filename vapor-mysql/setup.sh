#!/bin/bash
usermod -d /var/lib/mysql/ mysql
sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
service mysql start
mysql < /tmp/setup.sql
