#!/bin/bash
# Launch fiberspectrograph_broadband on auxtel-ill-control

# Get current working directory
cwd=$(pwd)

# Check to see if a name was given, otherwise assume both
if [ $# -lt 1 ]; then
  cscs="fiberspectrograph_broadband"
else
  cscs="$1"
fi

# source the lfa credentials
if [[ "$cscs" == *"fiberspectrograph_broadband"* ]]; then
  echo "Sourcing LFA credentials to pass to CSC"
  source .lfa_cred.sh
fi

# setup the DDS environment variables
cd docker-compose-ops/summit
source setup.env

cd auxtel-ill-control

for csc in ${cscs}
do
  docker-compose pull ${csc}
done
for csc in ${cscs}
do
  docker-compose up -d ${csc}
done
cd $cwd
