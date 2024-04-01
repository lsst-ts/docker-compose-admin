#!/bin/bash
# Shutdown OSPL daemon on fiber-spec01

# Get current working directory
cwd=$(pwd)

cd docker-compose-ops/tucson-teststand
source setup.env
cd support/fiber-spec01
docker compose down
# Return to current working directory
cd $cwd
