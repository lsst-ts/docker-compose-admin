#!/bin/bash
# Shutdown igusyaxis, igusyaxis, on toonie

# Get current working directory
cwd=$(pwd)

# Check to see if a name was given, otherwise assume both
if [ $# -lt 1 ]; then
  cscs="igusxaxis igusyaxis"
else
  cscs="$1"
fi

cd /deploy-lsstts/docker-compose-ops/tucson-teststand
source setup.env
cd calibration_lab

for csc in ${cscs}
do
  docker stop ${csc}
  docker container rm ${csc}
done

# Return to current working directory
cd $cwd
