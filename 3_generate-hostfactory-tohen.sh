#!/bin/bash -x

docker-compose exec conjur-cli \
               conjur hostfactory tokens create puppet \
    | jq -r '.[0].token'
