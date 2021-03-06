#!/usr/bin/bash

# 정리
#docker rmi -f $(docker images -q)
#docker rm -f $(docker ps -qa)

# OSRF 재단 배포 이미지
#docker pull osrf/ros:melodic-desktop-full-bionic

# id에 docker 등록 여부 판정
#expect << EOF
#spawn id
#expect {
#	"(docker)" { send "이미 존재함\r"; exp_continue }
#	eof
#}
#EOF

docker_check=$(docker images | awk '{ print $1 }' | grep "ros/melodic")
if [ -n "$docker_check" ];
then
	echo "이미 설치되어 있습니다!"
else
	echo "도커 이미지 설치!"
	docker build --no-cache --force-rm -f Dockerfile --build-arg HOST_USER=$USER -t ros/melodic:dev .
fi

USER_UID=$(id -u)
TAG='dev'
IMAGE='ros/melodic'
TTY='--device=/dev/ttyACM0'

#xhost +local:docker

echo "IMAGE=" $IMAGE
echo "TAG=" $TAG
echo "USER_UID=" $USER_UID
echo "USER=" $USER
#echo "IPADDR=" $(hostname -I | cut -d' ' -f1)
echo "TTY=" $TTY

USER="user2"

echo $USER

ENV_PARAMS=()
OTHER_PARAMS=()
args=("$@")
for ((a=0; a<"${#args[@]}"; ++a)); do
	case ${args[a]} in
		-e) ENV_PARAMS+=("${args[a+1]}"); unset args[a+1]; ;;
		--env=*) ENV_PARAMS+=("${args[a]}"); ;;
		*) OTHER_PARAMS+=("${args[a]}"); ;;
	esac
done

cur_loc=$(pwd)

winpty docker run -it \
	--init \
	--ipc=host \
	--shm-size=8G \
	--privileged \
	--net=host \
	-e DISPLAY=$DISPLAY \
	-e QT_GRAPHICSSYSTEM=native \
	-e CONTAINER_NAME=$TAG \
	-e USER=$USER \
	--env=UDEV=1 \
	--env=LIBUSB_DEBU=1 \
	--env="DISPLAY" \
	--env="QT_X11_NO_MITSHM=1" \
	${ENV_PARAMS[@]} \
	-v /dev:/dev \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	-v $cur_loc/workspace:/home/user2/workspace \
	$IMAGE:$TAG \
	${OTHER_PARAMS[@]}
#	/bin/bash

#export container_id=$(docker ps -l -q)
