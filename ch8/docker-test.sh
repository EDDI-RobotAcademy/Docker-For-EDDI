#!/usr/bin/bash

# volume-test 생성
docker build -t tbot-test .

cur_loc=$(pwd)
docker run -it -h tbot-test -v $cur_loc/proj:/home/eddi/proj -v $cur_loc/workspace:/home/eddi/workspace tbot-test /bin/bash -c "cd workspace; ./post-build.sh"

docker run -it -h tbot-test -v $cur_loc/proj:/home/eddi/proj -v $cur_loc/workspace:/home/eddi/workspace tbot-test
