#!/bin/bash
# Launch OSPL daemon on auxtel-ill-control

# Get current working directory
cwd=$(pwd)

cd docker-compose-ops/summit
source setup.env
cd support/auxtel-ill-control
docker-compose pull ospl-daemon
docker-compose up -d ospl-daemon

# Return to current working directory
cd $cwd
