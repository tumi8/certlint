#!/bin/bash


if [ "$1" == "-h" ]; then
  printf "Create table and index for CABlint in the database specified as first argument\n\n"
  printf "Usage: ./`basename $0` database-name\n"
  exit 0
fi

sudo -u postgres psql -d $1 -c "CREATE TABLE cablint_all (id SERIAL, cert_hash text, cert bytea);"

sudo -u postgres psql -d $1 -c "CREATE INDEX cablint_all_id_idx ON cablint_all USING btree (id);"

