#!/bin/bash

bash ./install_ros_melodic.sh

sudo apt-get install ros-melodic-joy ros-melodic-teleop-twist-joy \
  ros-melodic-teleop-twist-keyboard ros-melodic-laser-proc \
  ros-melodic-rgbd-launch ros-melodic-depthimage-to-laserscan \
  ros-melodic-rosserial-arduino ros-melodic-rosserial-python \
  ros-melodic-rosserial-server ros-melodic-rosserial-client \
  ros-melodic-rosserial-msgs ros-melodic-amcl ros-melodic-map-server \
  ros-melodic-move-base ros-melodic-urdf ros-melodic-xacro \
  ros-melodic-compressed-image-transport ros-melodic-rqt* \
  ros-melodic-gmapping ros-melodic-navigation ros-melodic-interactive-markers -y

sudo apt-get install ros-melodic-dynamixel-sdk -y
sudo apt-get install ros-melodic-turtlebot3-msgs -y
sudo apt-get install ros-melodic-turtlebot3 -y

echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
