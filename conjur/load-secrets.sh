#!/bin/bash

conjur authn login
conjur variable values add puppet/postgres-password 'wake bad operator pure'
conjur variable values add puppet/vendor-oauth-token '5262e7a7-4cfd-479d-833c-cbace96a32d3'
