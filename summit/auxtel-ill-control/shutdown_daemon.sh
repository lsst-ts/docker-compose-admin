#!/bin/bash
# Shutdown OSPL daemon on auxtel-ill-control

# Get current working directory
cwd=$(pwd)

cd docker-compose-ops/summit
source setup.env
cd support/auxtel-ill-control
docker-compose down
# Return to current working directory
cd $cwd
