FROM ubuntu:latest
RUN useradd asus-merlin sudo
USER asus-merlin
WORKDIR /home/asus-merlin/
SHELL ["/bin/bash", "-c"]
RUN (apt update; apt -y upgrade; apt- -y install curl rsync sudo) >/dev/null 2>&1
RUN mkdir -p "$HOME/amcfwm" && curl -s "https://raw.githubusercontent.com/Adamm00/am_cfwm/master/amcfwm.sh" -o "$HOME/amcfwm/amcfwm.sh" && chmod 755 "$HOME/amcfwm/amcfwm.sh"
CMD sh $HOME/amcfwm/amcfwm.sh install \
    sh $HOME/amcfwm/amcfwm.sh repo \
    amcfwm settings bac86 enable \
    amcfwm build \
    
