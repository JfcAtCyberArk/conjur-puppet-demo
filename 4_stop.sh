#!/bin/bash
docker-compose down
rm -f docker-compose.yml
rm -f puppet/manifests/secrets.pp
