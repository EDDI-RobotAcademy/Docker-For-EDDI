#!/usr/bin/bash

docker rm -f $(docker ps -qa)

docker build -t py_docker .

docker run -d -p 5000:5000 py_docker

sleep 1
curl localhost:5000
