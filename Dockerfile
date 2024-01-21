FROM cm2network/steamcmd

COPY launch.sh /home/steam

CMD ["/home/steam/launch.sh"]
