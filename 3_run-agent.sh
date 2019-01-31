#!/bin/bash

docker-compose run --rm agent

cat <<EOF
=============================
REPORT-Puppet agent ran with:
artifactory-login  => $(<tmp/login)
artifactory-api-key => $(<tmp/api-key)
=============================
EOF

rm -f tmp/login tmp/api-key
