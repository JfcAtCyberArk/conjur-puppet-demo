#!/bin/bash -x

#Variables
conjur_dns_name=
conjur_ip=
conjur_account=
conjur_authn_login=

sed -e "s/{{ CONJUR_DNS_NAME }}/$conjur_dns_name/g" \
    -e "s/{{ CONJUR_IP }}/$conjur_ip/g" \
    -e "s/{{ CONJUR_ACCOUNT }}/$conjur_account/g" \
    -e "s/{{ CONJUR_AUTHN_LOGIN }}/$conjur_authn_login/g" \
    < docker-compose-template.yml \
    > docker-compose.yml
docker-compose up -d puppet conjur-cli
docker exec -it conjur-cli bash -c 'yes yes | conjur init -a $CONJUR_ACCOUNT -h $CONJUR_URL'
