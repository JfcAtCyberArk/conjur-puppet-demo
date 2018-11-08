#!/bin/bash
docker-compose exec -T conjur-cli sh -c '
conjur variable values add puppet/postgres-password "long director down so"
conjur variable values add puppet/vendor-oauth-token "ee16b985-c72b-4cd3-abec-af38c056db00"
'
