#!/bin/bash

. ./vars.sh

cp conjur/secrets.pp puppet/manifests/secrets.pp

cat conjur/secrets.pp | sed -e "s/{{ CONJUR_ACCOUNT }}/$conjur_account/g" \
    -e "s/{{ CONJUR_DNS_NAME }}/$conjur_dns_name/g" \
    -e "s/{{ CONJUR_VERSION }}/$conjur_version/g" \
    -e "s/{{ CONJUR_HF_TOKEN }}/$conjur_hf_token/g" \
    -e "s@{{ CONJUR_SECRET_1 }}@$conjur_secret_1@g" \
    -e "s@{{ CONJUR_SECRET_2 }}@$conjur_secret_2@g" \
    > puppet/manifests/secrets.pp

openssl s_client -showcerts -connect $conjur_dns_name:443 < /dev/null 2> /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > conjur.pem
docker cp conjur.pem puppet:/etc/conjur.pem

rm -f conjur.pem
