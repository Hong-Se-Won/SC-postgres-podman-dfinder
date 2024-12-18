#!/bin/bash

mkdir -p /var/lib/pgsql/16/data
chown -R postgres:postgres /var/lib/pgsql
chown -R postgres:postgres /var/lib/pgsql/16/data
chmod 0700 /var/lib/pgsql/16/data


export PATRONI_CONFIG_FILE=/etc/patroni.yml
# Patroni 실행
exec su - postgres -c "patroni /etc/patroni.yml"