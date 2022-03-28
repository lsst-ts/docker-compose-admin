#!/bin/bash
# Launch igusyaxis, igusyaxis, on toonie

# Check to see if a name was given, otherwise assume both
if [ $# -lt 1 ]; then
  cscs="igusxaxis igusyaxis"
else
  cscs="$1"
fi


# Get current working directory
cwd=$(pwd)

# setup the DDS environment variables
cd /deploy-lsstts/docker-compose-ops/tucson-teststand
source setup.env

cd calibration_lab
for csc in ${cscs}
do
  docker-compose pull ${csc}
done
for csc in ${cscs}
do
  docker-compose up -d ${csc}
done
cd $cwd
