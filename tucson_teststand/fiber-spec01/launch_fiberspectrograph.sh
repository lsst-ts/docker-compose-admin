#!/bin/bash
# Launch fiberspectrograph_red on fiber-spec01

# Check to see if a name was given, otherwise assume both
if [ $# -lt 1 ]; then
  cscs="red"
else
  cscs="$1"
fi
source .lfa_cred.sh
cd docker-compose-ops/tucson-teststand
source setup.env
cd calibration_lab_prod
for csc in ${cscs}
do
  docker compose pull fiberspectrograph_${csc}
done
for csc in ${cscs}
do
  docker compose up -d fiberspectrograph_${csc}
done
cd $cwd
