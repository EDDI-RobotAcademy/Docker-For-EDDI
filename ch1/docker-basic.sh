#!/usr/bin/bash

# 도커 버전을 볼 수 있음
docker version

# 도커가 동작하면서 메시지 출력 가능
docker run debian echo "Hello Docker"

# 다운로드 받은 debian 이미지 상에서 bash 쉘 실행
docker run -i -t debian /bin/bash -c "echo \"Hello from Docker Container\""

# -h 옵션을 통해서 구동하는 컨테이너의 이름을 지정할 수 있음
# 필요에 따라서 자동화 시킨 이후 zybo z7, ultra96, RFSoC 등으로 이름 지을 수 있음
docker run -h CONTAINER -i -t debian /bin/bash

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
