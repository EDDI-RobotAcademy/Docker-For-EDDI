#!/usr/bin/bash

echo "docker signal 감지"
id=$(docker run -d ubuntu:16.04 bash -c "trap 'echo caught' SIGTRAP; while true; do sleep 1; done;")
sleep 1
docker kill -s SIGTRAP $id
sleep 1
docker logs $id
sleep 1
docker kill $id
sleep 1
docker rm -f $(docker ps -aq)
