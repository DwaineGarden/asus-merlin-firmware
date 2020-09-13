FROM ubuntu:18.04
RUN apt-get update; apt-get -y upgrade
RUN apt-get -y install sudo apt-utils curl xxd rsync bc
#RUN useradd asus-merlin sudo
RUN adduser --disabled-password --gecos '' asus-merlin
RUN adduser asus-merlin sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER asus-merlin
WORKDIR /home/asus-merlin/
SHELL ["/bin/bash", "-c"]
RUN mkdir -p "$HOME/amcfwm" && curl -s "https://raw.githubusercontent.com/Adamm00/am_cfwm/master/amcfwm.sh" -o "$HOME/amcfwm/amcfwm.sh" && chmod 755 "$HOME/amcfwm/amcfwm.sh"

    
