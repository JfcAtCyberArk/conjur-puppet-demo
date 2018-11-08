#!/bin/bash
docker-compose exec -T conjur-cli \
               conjur resource permitted_roles \
               variable:puppet/postgres-password \
               execute
