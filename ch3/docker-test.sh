#!/usr/bin/bash

#
docker build -t test/cowsay-dockerfile .

#
docker run test/cowsay-dockerfile "Moo"

# TODO: add copy shell
docker 
