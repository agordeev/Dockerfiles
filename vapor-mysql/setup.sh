#!/bin/bash
service mysql start
mysql < /tmp/setup.sql
