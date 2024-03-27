#!/bin/bash
# Launch OSPL daemon on fiber-spec01

# Get current working directory
cwd=$(pwd)

cd docker-compose-ops/tucson-teststand
source setup.env
cd support/fiber-spec01
docker compose pull ospl-daemon
docker compose up -d ospl-daemon

# Return to current working directory
cd $cwd
