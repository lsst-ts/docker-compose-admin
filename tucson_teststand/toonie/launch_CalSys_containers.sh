#!/bin/bash
# Launch electrometer2, on toonie
# other CSCs, both electrometers and fiber_spectrographs to be added in the future

# Get current working directory
cwd=$(pwd)

# Check to see if a name was given, otherwise assume both
if [ $# -lt 1 ]; then
  cscs="ledprojector fiberspectrograph_blue fiberspectrograph_red electrometer1 electrometer2 electrometer3 electrometer4 electrometer5 electrometer6 laser cbp zaberstage"  # Will add more when they come online
else
  cscs="$1"
fi

source /deploy-lsstts/.kafka-cred.sh
cd /deploy-lsstts/docker-compose-ops/tucson-teststand
source setup.env

# source the lfa credentials
if [[ "$cscs" == *"fiberspectrograph"* || "$cscs" == *"electrometer"* ]]; then
  echo "Sourcing LFA credentials to pass to CSC"
  source /deploy-lsstts/.lfa_cred.sh
fi

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
