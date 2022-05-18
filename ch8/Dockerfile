FROM ubuntu:18.04
MAINTAINER	gcccompil3r@gmail.com
LABEL 		authors="gcccompil3r@gmail.com"

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS="yes"
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

#RUN adduser --disabled-password --gecos '' eddi
#RUN mkdir -p /home/eddi

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y language-pack-ko

# set locale ko_KR
RUN locale-gen ko_KR.UTF-8

ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

RUN apt-get install -y \
        vim \
        iputils-ping \
        net-tools

RUN apt-get install -y bash expect sudo
RUN apt-get install -y chrony ntpdate build-essential curl nano
RUN apt-get install -y lsb-release

RUN dpkg-reconfigure tzdata
#RUN ntpdate ntp.ubuntu.com
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
RUN apt-get update -y
RUN apt-get install -y ros-melodic-ros-base
RUN apt-get install python-rosdep

RUN adduser --disabled-password --gecos '' eddi && \
    usermod -aG sudo eddi && \
    echo "eddi ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

COPY --chown=eddi:eddi ./workspace /home/eddi/workspace
COPY --chown=eddi:eddi ./proj /home/eddi/proj

USER eddi
ENV HOME /home/eddi
ENV LANG en_US.UTF-8
WORKDIR /home/eddi
