#!/usr/bin/bash

# nginx 서버 구동
docker run -d -p 8000:80 nginx

# localhost:8000에 http 요청
curl localhost:8000

id=$(docker run -d -P nginx)

#docker port $id 80
#docker port $(docker run -d -P nginx) 80 | awk '{print substr($1,4)}'
#checked_port=$(docker port $id 80 | awk '{print substr($1, 4)}')
checked_port=$(docker port $id 80 | awk '{print substr($2, 4)}')

echo $checked_port
#curl localhost:$checked_port
