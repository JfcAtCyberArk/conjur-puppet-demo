#!/bin/bash

#Variables
conjur_account=
conjur_dns_name=
conjur_version=

cp conjur/secrets.pp puppet/manifests/secrets.pp

cat conjur/secrets.pp | sed -e "s/{{ CONJUR_ACCOUNT }}/$conjur_account/g" \
    -e "s/{{ CONJUR_DNS_NAME }}/$conjur_dns_name/g" \
    -e "s/{{ CONJUR_VERSION }}/$conjur_version/g" \
    > puppet/manifests/secrets.pp

docker exec -it conjur-cli bash -c 'conjur plugin install policy'
docker exec -it conjur-cli bash -c 'conjur policy load /demo/puppet.yml'
docker exec -it conjur-cli bash -c '/demo/load-secrets.sh'

openssl s_client -showcerts -connect $conjur_dns_name:443 < /dev/null 2> /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > conjur.pem
docker cp conjur.pem puppet:/etc/conjur.pem
rm -f conjur.pem
