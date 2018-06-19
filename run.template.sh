#!/bin/sh
NAME=CONTAINER

#echo "Enabling DISPLAY for python..."
#export IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
#open -a XQuartz
#xhost + $IP

if [ ! -z "$1" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=${NAME})" ]; then
        echo "Resetting state..."
        docker rm ${NAME} >/dev/null
    fi
fi

if [ "$(docker ps -q -f name=${NAME})" ]; then
        echo "Attaching to running container..."
        docker attach ${NAME}
else
    if [ "$(docker ps -aq -f status=exited -f name=${NAME})" ]; then
        echo "Start existing container..."
        docker start -i ${NAME}
    else
        echo "Init CONTAINER container..."
        docker run --rm -it --name ${NAME} -v "$(pwd):/project" -v "${HOME}/.m2/repository:/repository" -p 9080:9080 ivonet/${NAME} $*
        #-e DISPLAY=$IP:0 -v /tmp/.X11-unix:/tmp/.X11-unix
    fi
fi