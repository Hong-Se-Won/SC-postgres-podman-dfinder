#!/bin/bash

#mkdir -p /var/lib/postgresql/data 
#chown -R postgres:postgres /var/lib/postgresql
#chown -R postgres:postgres /var/lib/postgresql/data
#chmod 0700 /var/lib/postgresql/data
cat /etc/passwd
mkdir -p /var/lib/pgsql/16/data 
chown -R postgres:postgres /var/lib/pgsql
chown -R postgres:postgres /var/lib/pgsql/16/data
chmod 0700 /var/lib/pgsql/16/data
export PATRONI_CONFIG_FILE=/etc/patroni.yml
# Patroni 실행
ls -al /usr/local/bin/post_bootstrap.sh
ls -al /etc/patroni.yml
exec su - postgres -c "patroni /etc/patroni.yml"