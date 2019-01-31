#!/bin/bash -x

. ./vars.sh

sed -e "s/{{ CONJUR_DNS_NAME }}/$conjur_dns_name/g" \
    -e "s/{{ CONJUR_IP }}/$conjur_ip/g" \
    < docker-compose-template.yml \
    > docker-compose.yml

docker-compose up -d puppet
