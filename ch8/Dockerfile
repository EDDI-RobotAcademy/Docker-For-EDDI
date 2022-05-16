FROM ubuntu:18.04
MAINTAINER	gcccompil3r@gmail.com
LABEL 		authors="gcccompil3r@gmail.com"

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS="yes"

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

RUN useradd -ms /bin/bash eddi

COPY --chown=eddi:eddi ./workspace /home/eddi/workspace
RUN mkdir /home/eddi/proj

USER eddi
ENV HOME /home/eddi
ENV LANG en_US.UTF-8
WORKDIR /home/eddi
