FROM    ubuntu:16.04
LABEL   authors="Byeongmin Ryoo <21600220@handong.edu>, Seungjun Baek <21900346@handong.edu>"

# basic update & upgrade
RUN set -xe \
    && apt-get -y -qq update \
    && apt-get -y -qq upgrade

# set time zone
RUN set -xe \
    && apt-get -y -qq install tzdata
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

# set locale UTF-8
RUN apt-get -y -qq install locales \
    && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN set -xe \ 
    && apt -y -qq install vim tmux perl wget tar man sudo adduser netstat-nat net-tools curl w3m git build-essential xxd file make libcurses-perl python python3-pip zlib1g libjpeg8-dev zlib1g-dev
