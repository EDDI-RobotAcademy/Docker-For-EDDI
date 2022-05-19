#!/bin/sh

cat /etc/apt/sources.list
apt-get autoremove --purge --yes \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /etc/ros/rosdep/sources.list.d/20-default.list

sed -i -e 's+\(^deb http://security.*\)+# \1+g' /etc/apt/sources.list
apt-get clean && apt-get update

apt-get install -y \
	tmux \
	curl \
	wget \
	vim \
	git \
	sudo \
	libgl1-mesa-glx \
	libgl1-mesa-dri \
	mesa-utils \
	unzip \
	ntp \
	whois \
	net-tools \
	locales \
	ssh

locale-gen en_US.UTF-8

FILE="/etc/apt/sources.list.d/ros-latest.list"

if [ ! -e $FILE ];then
  echo "파일이 존재하지 않습니다!"
  sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list'
  apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
  apt-get update
  apt-get install -y \
  	protobuf-compiler \
	libeigen3-dev \
	libopencv-dev \
	ros-melodic-rqt*
fi

apt-get install -y python3 python3-pip python-rosinstall python-rosdp python-rosinstall-generator

rosdep init
rosdep update
rosdep fix-permissions

echo HOME=${HOME}

apt-get autoclean

mkdir -p $HOME/catkin_ws/src && cd $HOME/catkin_ws/src && catkin_init_workspace

cd $HOME/catkin_ws && catkin_make

echo "source /opt/ros/melodic/setup.bash" >> $HOME/.bashrc
echo "source /$HOME/catkin_ws/devel/setup.bash" >> $HOME/.bashrc
echo "export ROS_HOSTNAME=localhost" >> $HOME/.bashrc
echo "export ROS_MASTER_URI=http://localhost:11311" >> $HOME/.bashrc
echo "alias cw='cd ~/catkin_ws'" >> $HOME/.bashrc
echo "alias cs='cd ~/catkin_ws/src'" >> $HOME/.bashrc
echo "alias cm='cd ~/catkin_ws && catkin_make'" >> $HOME/.bashrc

source /opt/ros$ROS_DISTRO/setup.bash
source /$HOME/catkin_ws/devel/setup.bash

IPADDR=$(hostname -I | cut -d' ' -f1)
echo "USER=$USER"
echo "HOME=$HOME"
echo "IPADDR=$IPADDR"
echo "ROS_ROOT=$ROS_ROOT"
echo "ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH"
echo "ROS_HOSTNAME=$ROS_HOSTNAME"
echo "ROS_MASTER_URI=$ROS_MASTER_URI"
