#!/bin/bash
# Shutdown OSPL daemon on loonie

# Get current working directory
cwd=$(pwd)

cd /deploy-lsstts/docker-compose-ops/tucson-teststand
source setup.env
cd support
docker-compose down
# Return to current working directory
cd $cwd
