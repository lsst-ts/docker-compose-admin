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

# setup the DDS environment variables
cd /deploy-lsstts/docker-compose-ops/summit
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
