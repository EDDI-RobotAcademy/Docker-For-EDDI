#!/usr/bin/bash

# 존재하는 모든 컨테이너 삭제
docker rm $(docker ps -qa)

# cowsay 와 fourtune 설치하고 실행
docker run -it --name cowsay --hostname cowsay debian bash -c "apt-get update; apt-get install cowsay fortune; /usr/games/fortune | /usr/games/cowsay"

# 동작 안 될 것임
docker run test/cowsayimage /usr/games/cowsay "Moo"

# 기존 작업 사항을 커밋하여 저장함
docker commit cowsay test/cowsayimage

# test/cowsayimage 로 저장한 도커 이미지로 다시 명령을 실행함
docker run test/cowsayimage /usr/games/cowsay "Moo"
