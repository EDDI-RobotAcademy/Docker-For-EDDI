#!/usr/bin/bash

# 정리
docker rm -f $(docker ps -qa)

# 환경 변수 전달
docker run -e var1="환경변수" -e var2="요래전달" ubuntu:16.04 env

# id 값 기반으로 docker attach 하기
echo ""
echo "docker attach 테스트"
id=$(docker run -d ubuntu:16.04 sh -c "while true; do echo 'tick'; sleep 1; done;")
docker attach $id
