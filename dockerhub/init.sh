#!/bin/sh
. ./.env
sed -i.bak -e "s/^IP\.1.*$/IP.1 = ${MACHINE_FQDN}/" ./build/openssl.cnf
sed -i.bak -e "s/server_name .*;/server_name ${MACHINE_FQDN};/" ./volume/nginx/nginx.conf
openssl req -newkey rsa:4096 -nodes -sha256 -keyout ./volume/secrets/portus.key -x509 -days 36500 -out ./volume/secrets/portus.crt -config ./build/openssl.cnf -subj "/C=${C:-}/ST=${ST:-}/L=${L:-}/O=${O:-}/OU=${OU:-}/CN=${MACHINE_FQDN:-}"
