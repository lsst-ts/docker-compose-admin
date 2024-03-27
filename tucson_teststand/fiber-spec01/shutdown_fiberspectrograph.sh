#!/bin/bash
# Shutdown fiberspectrograph_red on fiber-spec01
source .lfa_cred.sh
cd docker-compose-ops/tucson-teststand
source setup.env
cd calibration_lab_prod
docker compose down
cd ~/
