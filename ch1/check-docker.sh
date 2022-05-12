#!/usr/bin/bash

# 도커 컨테이너 정보 조회
docker ps

# awk 를 통해 1번째 열을 추출하고 sed로 2번째 열을 가져옴
container_id=`docker ps | awk '{ print $1 }' | sed -n 2p`
echo $container_id

# docker 이미지 정보를 json 형태로 추출
docker inspect $container_id
sleep 5
clear

# 세부 정보중 일부 정보(IP) 추출
docker inspect $container_id | grep IPAddress

# 도커 이미지가 실행중
docker diff $container_id

#
#docker logs fervent_chaplygin

#
#docker rm fervent_chaplygin
#
##
#docker run -it --name cowsay --hostname cowsay debian bash
#
#apt-get update
#/usr/games/fortune | /usr/games/cowsay
#exit
#
##
#docker commit cowsay test/cowsayimage
#
##
#docker run test/cowsayimage /usr/games/cowsay "Moo"
#
