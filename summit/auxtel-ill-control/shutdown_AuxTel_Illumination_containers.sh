#!/bin/bash
# Shutdown the fiberspectrograph_broadband, on auxtel-ill-control

# Get current working directory
cwd=$(pwd)

# Check to see if a name was given, otherwise assume both
if [ $# -lt 1 ]; then
  cscs="fiberspectrograph_broadband"
else
  cscs="$1"
fi

cd /deploy-lsstts/docker-compose-ops/summit
source setup.env
cd auxtel-ill-control

for csc in ${cscs}
do
  echo "Stopping ${csc} container"
  docker stop ${csc}
  echo "Removing ${csc} container"
  docker container rm ${csc}
done

# Return to current working directory
cd $cwd
