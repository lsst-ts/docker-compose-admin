#!/bin/bash
# Launch OSPL daemon on loonie

# Get current working directory
cwd=$(pwd)

cd /deploy-lsstts/docker-compose-ops/tucson-teststand
source setup.env
cd support
docker-compose pull ospl-loonie
docker-compose up -d ospl-loonie

# Return to current working directory
cd $cwd
