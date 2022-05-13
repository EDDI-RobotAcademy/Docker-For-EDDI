#!/usr/bin/bash

# 정리
docker rm $(docker ps -qa)

# volume-test 생성
docker build -t volume-test .

# 현재 위치
cur_loc=$(pwd)
echo "$cur_loc"

# 현재 위치 도커 /data 에 맵핑 이후 /data 탐색
# 결국 현재 위치의 데이터가 보일 것이며
# 이 위치가 도커상에 맵핑된 것임
docker run --name volume-test -v $cur_loc:/data ubuntu:16.04 ls /data

# 컨테이너 이름으로 접근할 때 활용함
echo ""
echo "--volumes-from 테스트"
docker run -it -h NEWCONTAINER --volumes-from volume-test ubuntu:16.04 /bin/bash -c "ls /data"
