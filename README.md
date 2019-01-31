# conjur-puppet-demo
Conjur module for puppet - demo

## How it works 
1 - The docker-compose file is used to deploy a puppet server. The puppet server image is modified to install the Conjur module. 

2 - The manifest secrets.pp is configured so that it can retrieve secrets from Conjur. 

3 - A puppet agent is launched, it gets enrolled in Conjur, and can then use its own identity to retrieve secrets from Conjur (site.pp).

Secrets that have been retrieved will be exposed in subfolders of tmp/ for demo purposes.

4 - Clean environment

## Software Prerequisites
Docker should be installed

Docker-compose should be installed

## Variables to set
Variables should be set in the file vars.sh

## Versions
cyberark/conjur (module) : v1.2.0

puppet : 6.2.0 (latest version as for 01/29/2019)
 







