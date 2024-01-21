#!/bin/bash

set +x

./steamcmd.sh +quit

while true; do
    sleep 2
    ./steamcmd.sh +force_install_dir /home/steam/palworld +login anonymous +app_update 2394010 validate +quit
    (cd /home/steam/palworld && ./PalServer.sh port=8211 players=32)
done
