FROM ubuntu:18.04
#RUN useradd asus-merlin sudo
RUN adduser --disabled-password --gecos '' asus-merlin
RUN useradd asus-merlin sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER asus-merlin
WORKDIR /home/asus-merlin/
SHELL ["/bin/bash", "-c"]
RUN apt-get update
RUN mkdir -p "$HOME/amcfwm" && curl -s "https://raw.githubusercontent.com/Adamm00/am_cfwm/master/amcfwm.sh" -o "$HOME/amcfwm/amcfwm.sh" && chmod 755 "$HOME/amcfwm/amcfwm.sh"
CMD sh $HOME/amcfwm/amcfwm.sh install ;\
    sh $HOME/amcfwm/amcfwm.sh repo ; \
    sh $HOME/amcfwm/amcfwm.sh settings bac86 enable ; \
    sh $HOME/amcfwm/amcfwm.shamcfwm build 
    
