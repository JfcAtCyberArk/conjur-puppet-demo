#!/bin/bash
docker-compose exec -T conjur-cli \
  conjur host list -s puppet
