#!/bin/bash
POSGRESQL=$(find /etc/postgresql/ | grep postgresql.conf)
PG_HBA=$(find /etc/postgresql/ | grep pg_hba.conf)
sed -ri "s!^#?(listen_addresses)\s*=\s*\S+.*!\1 = '*'!" $POSGRESQL
sed -i "s/\(all\s*127.0.0.1\/32\s*\).*/\1 trust/" $PG_HBA
echo "" >> $PG_HBA
echo "# vapor-postgresql update" >> $PG_HBA 
echo "host    all             all             0.0.0.0/0               trust" >> $PG_HBA
service postgresql start
sudo -u postgres psql < /tmp/setup.sql
