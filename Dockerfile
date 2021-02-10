FROM    ubuntu:16.04
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

# oh-my-zsh (Shell theme)
RUN set -xe \
    && apt -y -qq install zsh nano \
    && wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

CMD ["zsh"]
