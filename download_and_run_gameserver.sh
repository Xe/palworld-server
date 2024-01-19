#!/bin/bash

set +x

# Download game files using SteamCMD to the specified volume
# The volume needs to be mounted when running the container

export HOME=/home

# Update steamcmd
steamcmd +quit

# Run SteamCMD to download the game files using app ID - 740 ( CSGO server )
steamcmd +force_install_dir /home/game_files +login anonymous +app_update 740 validate +quit

# Copying server configuration files ( for CSGO )

#cp *.cfg game_files/csgo/cfg/

# Start the game server using the downloaded game files
cd game_files

sleep inf

# Finally start the game server
./srcds_run -game csgo -console -usercon +game_type 0 +game_mode 1 +mapgroup mg_active +map de_dust2
