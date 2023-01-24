#!/bin/bash
# Shutdown OSPL daemon on auxtel-ill-control

# Get current working directory
cwd=$(pwd)

cd /deploy-lsstts/docker-compose-ops/summit
source setup.env
cd support
docker-compose down
# Return to current working directory
cd $cwd
