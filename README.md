# conjur-puppet-demo
Demonstration of the use of Conjur module for Puppet

## How it works 
1 - docker-compose file will launch one puppet server and one conjur-cli. 
2 - A policy will be loaded to conjur to define puppet group of hosts, some test secrets and permissions related to those secrets.
3 - A host factory token related to the puppet group of hosts is generated. 
MANUAL : the token retrieved in step 3 should be copied to puppet/manifests/secrets.pp to replace "placeholder"
4 - A puppet agent is ran using the docker-compose file, the puppet server will communicate the host factory token to the agent. 
  - The agent will use the host factory token to enroll to Conjur (obtain an identity from Conjur).
  - The agent can now use its own identity to fetch secrets from Conjur. (secrets are defined in the conjur/secrets.pp file and retrieved in puppet/manifests/site.pp file)
  - Secrets retrieved are temporary stored and exposed for demo purposes
5 - Rotate secrets and run step 4 if you'd like to. 
6 & 7 : display information about what have been done. 
8 : clean environment

## Software Prerequisites
Docker should be installed
Docker-compose should be installed 
jq (On CentOS 7 : yum install epel-release && yum install jq)

## Variables to set
Variables section of script 1 and 2 should be set.



