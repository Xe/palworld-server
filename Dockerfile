FROM cm2network/steamcmd:root

COPY launch.sh /home/steam

RUN apt-get update \
 && apt-get install -y socat net-tools vim nano

USER steam

CMD ["/home/steam/launch.sh"]
