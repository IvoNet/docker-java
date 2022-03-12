#!/usr/bin/env bash
VERSION=11

docker rmi openjdk:${VERSION}
docker pull openjdk:${VERSION}
docker tag openjdk:${VERSION} ivonet/openjdk:${VERSION}
docker push ivonet/openjdk:${VERSION}