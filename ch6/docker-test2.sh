#!/usr/bin/bash

# id 값 기반으로 실행 하기
echo "docker attach 테스트"
id=$(docker run -d ubuntu:16.04 sh -c "while true; do sleep 1; done;")
docker exec $id echo "EDDI Robot Academy"
docker exec -it $id /bin/bash
