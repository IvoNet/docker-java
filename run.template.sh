#!/bin/sh
NAME=CONTAINER
docker run --rm -it --name ${NAME} -v "$(pwd):/project" -v "${HOME}/.m2/repository:/repository" -p 9080:9080 ivonet/${NAME} $*
