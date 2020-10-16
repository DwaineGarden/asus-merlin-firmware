FROM ubuntu:latest
RUN apt-get update; apt-get -y upgrade
RUN apt-get -y install sudo apt-utils curl xxd rsync bc
#RUN useradd asus-merlin sudo
RUN adduser --disabled-password --gecos '' admin
RUN adduser admin sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER admin
WORKDIR /home/admin/
SHELL ["/bin/bash", "-c"]
RUN mkdir -p "$HOME/amcfwm" && curl -s "https://raw.githubusercontent.com/Adamm00/am_cfwm/master/amcfwm.sh" -o "$HOME/amcfwm/amcfwm.sh" && chmod 755 "$HOME/amcfwm/amcfwm.sh"
RUN sh $HOME/amcfwm/amcfwm.sh settings bac86 enable
