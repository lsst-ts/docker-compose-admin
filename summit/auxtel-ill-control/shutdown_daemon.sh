#!/bin/bash
# Shutdown OSPL daemon on auxtel-ill-control

# Get current working directory
cwd=$(pwd)

cd docker-compose-ops/summit
source setup.env
cd support
docker-compose down
# Return to current working directory
cd $cwd
