#!/bin/bash
# Launch OSPL daemon on auxtel-ill-control

# Get current working directory
cwd=$(pwd)

cd docker-compose-ops/summit
source setup.env
cd support
docker-compose pull ospl-auxtel-ill-control
docker-compose up -d ospl-auxtel-ill-control

# Return to current working directory
cd $cwd
