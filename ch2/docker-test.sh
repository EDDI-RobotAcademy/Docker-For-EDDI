#!/usr/bin/bash

# 모든 이미지 삭제가 필요한 경우
#docker rmi -f $(docker images -q)

# 컨테이너 전부 삭제
docker rm $(docker ps -qa)

# Dockerfile 기반으로 이미지 생성
docker build -t test/cowsay-dockerfile .

# 상태 저장
docker commit cowsay test/cowsayimage

# 생성한 이미지의 실행 파일 구동
docker run test/cowsay-dockerfile /usr/games/cowsay "Moo"

# 상태 확인
docker ps -a
