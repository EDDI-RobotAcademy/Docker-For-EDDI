#!/usr/bin/bash

#
docker build -t test/cowsay-dockerfile .

#
docker run test/cowsay-dockerfile /usr/games/cowsay "Moo"

#
docker ps -a
