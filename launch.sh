#!/bin/bash

set +x

(
    while true; do
        socat -T 600 UDP4-LISTEN:8211,fork,reuseaddr,bind=fly-global-services UDP4:127.0.0.1:8212
        sleep 2
    done
) &

./steamcmd.sh +quit

while true; do
    sleep 2
    ./steamcmd.sh +force_install_dir /home/steam/palworld +login anonymous +app_update 2394010 validate +quit
    (cd /home/steam/palworld && ./PalServer.sh port=8211 players=32 -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS)
done
