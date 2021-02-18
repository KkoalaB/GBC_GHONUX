FROM    ubuntu:18.04
LABEL   authors="Byeongmin Ryoo <21600220@handong.edu>, Seungjun Baek <21900346@handong.edu>"

# basic update & upgrade
RUN set -xe \
    && apt -y -qq update \
    && apt -y -qq upgrade

# set time zone
RUN set -xe \
    && apt -y -qq install tzdata
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

# set locale UTF-8
RUN apt -y -qq install locales \
    && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

## install extensions ##
# vim: text editor
# tmux: split screen
# wget: file downloader
# man: linux manual
# sudo: superuser do
# net-tools: network tools (ifconfig etc...)
# git: git
# build-essential: generaly used packages for building source codes
# libcurses-perl: libraries for perl
# python: python
# python-pip: python library downloader (pip)
# python3: python3
# python3-pip: python library downloader (pip3)
# curl: transferring data from or to a server designed to work without user interaction
RUN set -xe \ 
    && apt -y -qq install vim tmux wget tar man sudo net-tools git build-essential libcurses-perl python python-pip python3 python3-pip curl

### For GBC_Secruity ###
## gdb-peda-pwndbg-gef all in one
# https://infosecwriteups.com/pwndbg-gef-peda-one-for-all-and-all-for-one-714d71bf36b8
# by this, you can excute peda, pwndbg, gef as like gdb-peda, gdb-pwndbg, gdb-gef
WORKDIR "/root"
RUN git clone https://github.com/soaringk/gdb-peda-pwndbg-gef.git
WORKDIR "/root/gdb-peda-pwndbg-gef"
RUN ./install.sh
RUN set -xe \
    && cp gdbinit ./../".gdbinit"
RUN set -xe \
    && sudo cp gdb-peda /usr/bin/gdb-peda \
    && sudo cp gdb-pwndbg /usr/bin/gdb-pwndbg \
    && sudo cp gdb-gef /usr/bin/gdb-gef
RUN set -xe \
    && sudo chmod +x /usr/bin/gdb-*

## Radare2
WORKDIR "/root"
RUN set -xe \
    && sudo apt install -y radare2

## ROPgadget
WORKDIR "/root"
RUN pip install ropgadget

## bof


### Shell theme ###
# oh-my-zsh (Shell theme)
RUN set -xe \
    && apt -y -qq install zsh nano \
    && wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

CMD ["zsh"]