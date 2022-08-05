#!/bin/bash
# Shutdown all or one of electrometer1, atmonochromator, or fiberspectrograph_broadband, on loonie

# Get current working directory
cwd=$(pwd)

# Check to see if a name was given, otherwise assume both
if [ $# -lt 1 ]; then
  cscs="electrometer1 atmonochromator fiberspectrograph_broadband atwhitelight"
else
  cscs="$1"
fi

cd /deploy-lsstts/docker-compose-ops/tucson-teststand
source setup.env
cd calibration_lab

for csc in ${cscs}
do
  echo "Stopping ${csc} container"
  docker stop ${csc}
  echo "Removing ${csc} container"
  docker container rm ${csc}
done

# Return to current working directory
cd $cwd
