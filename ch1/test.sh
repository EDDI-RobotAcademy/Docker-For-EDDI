#!/usr/bin/bash

# 도커 버전을 볼 수 있음
docker version

# 도커가 동작하면서 메시지 출력 가능
docker run debian echo "Hello Docker"

# 다운로드 받은 debian 이미지 상에서 bash 쉘 실행
docker run -i -t debian /bin/bash

# 이후 터미널 I/O 연결 필요
echo "Hello from Docker Container"
exit

#
docker run -h CONTAINER -i -t debian /bin/bash

mv /bin /break
ls
exit

# 도커 컨테이너 정보 조회
docker ps

# 좀 더 세부 정보 파악
docker inspect fervent_chaplygin

# 세부 정보중 일부 정보(IP) 추출
docker inspect fervent_chaplygin | grep IPAddress

#
docker diff fervent_chaplygin

#
docker logs fervent_chaplygin

#
docker rm fervent_chaplygin

#
docker run -it --name cowsay --hostname cowsay debian bash

apt-get update
/usr/games/fortune | /usr/games/cowsay
exit

#
docker commit cowsay test/cowsayimage

#
docker run test/cowsayimage /usr/games/cowsay "Moo"

