#!/bin/bash
# Launch electrometer, atmonochromator, fiberspectrograph, on loonie

# Get current working directory
cwd=$(pwd)

# Check to see if a name was given, otherwise assume both
if [ $# -lt 1 ]; then
  cscs="electrometer1 atmonochromator fiberspectrograph_broadband atwhitelight"
else
  cscs="$1"
fi

# setup the DDS environment variables
cd /deploy-lsstts/docker-compose-ops/tucson-teststand
source setup.env

if [ ! -d ${OSPL_SHMEM_SOCKET_DIR} ] 
then
  #create temporary file if not present
  mkdir -p ${OSPL_SHMEM_SOCKET_DIR}
  sudo chmod a+rw ${OSPL_SHMEM_SOCKET_DIR}
fi

# source the lfa credentials
if [[ "$cscs" == *"fiberspectrograph_broadband"* ]]; then
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
