#!/usr/bin/bash

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update
sudo apt-get install docker-ce

curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` -o ~/docker-machine
chmod +x ~/docker-machine
sudo cp ~/docker-machine /usr/local/bin/

sudo apt-get install linux-headers-`uname -r`
wget https://download.virtualbox.org/virtualbox/6.1.34/virtualbox-6.1_6.1.34-150636.1~Ubuntu~eoan_amd64.deb
sudo dpkg -i virtualbox-6.1_6.1.34-150636.1~Ubuntu~eoan_amd64.deb

sudo ufw allow 2376

docker-machine version
docker-machine create default
