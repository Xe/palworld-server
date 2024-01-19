# Using the latest ubuntu image
FROM ubuntu:latest
RUN apt update

# Setting /home as our working directory
WORKDIR /home
ENV HOME=/home

# Download and install all the necessary dependencies for steamcmd
RUN dpkg --add-architecture i386 \
 && apt-get update -y && apt install wget lib32gcc-s1 lib32stdc++6 \
  curl libstdc++6:i386 lib32z1 -y

# Presetting Values for liscence agreement keys using debconf-set-selections
RUN echo steam steam/question select "I AGREE" |  debconf-set-selections 
RUN echo steam steam/license note '' | debconf-set-selections 

# Installing SteamCMD  
RUN mkdir steamcmd && mkdir game_files && apt-get install -y --no-install-recommends steamcmd 

# Create symlink for executable in /bin
RUN ln -s /usr/games/steamcmd /usr/bin/steamcmd 

# Copy our shell script to docker container.
# This shell script will be used to download gamefiles
# and configure our gameserver.
# Description for this file is given later

COPY download_and_run_gameserver.sh /entrypoint.sh

# Copy server configuration to container ( Counter Strike specific )
COPY *.cfg /home/

# Set our shell script as entrypoint for our container
# So that it gets executed when we RUN the container
CMD [ "/entrypoint.sh"]
