#!/bin/bash
docker stop $1
docker ps -a -f status=exited -q
docker rm $(docker ps -a -f status=exited -q)

if [ $3 = "rmImg" ]
then
docker images -q | grep “$2”
echo "docker rmi -f dangling=true  $(docker images -q | grep “$2”)"
docker rmi -f dangling=true  $2
sleep 3
docker rmi -f dangling=true  $(docker images -q | grep “$2”)
fi
