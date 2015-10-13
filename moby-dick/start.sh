#!/bin/bash

docker rm -f workshop-moby-dick 2> /dev/null

docker run \
    -d -p 8080:80 \
    -v $PWD/code:/code \
    --name=workshop-moby-dick \
    workshop/moby-dick
