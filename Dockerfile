# ----------------------------------
# EnxadaHost WineDocker
# Environment: Fedora Wine-Steam
# ----------------------------------
FROM debian:stable-slim

MAINTAINER Enx services, <gabriel.perrett@enx>

RUN apt update -y && apt install software-properties-common curl -y \
&& useradd -m steam \
&& su steam \
&& mkdir -p /home/steam/steamcmd && cd /home/steam/steamcmd  \
&& curl -o steamcmd_linux.tar.gz "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" \
&& tar zxf steamcmd_linux.tar.gz \
&& rm steamcmd_linux.tar.gz \
&& dpkg --add-architecture i386 && apt update -y \
&& apt install lib32gcc-s1  wine tar wget curl xvfb -y \
&& adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
