#!/bin/bash
#docker stop $1
#docker ps -a -f status=exited -q
#docker rm $(docker ps -a -f status=exited -q)
#docker images -q | grep “$2”
#docker rmi -f dangling=true  $(docker images -q | grep “$2”)
#######################################################################
#     1st argument is container name
#     2nd argument is image name
#     3rd argument is port map
#######################################################################
export OPTS="-XX:NewRatio=1 -XX:+ResizeTLAB -XX:+UseConcMarkSweepGC -XX:+CMSConcurrentMTEnabled -XX:+CMSClassUnloadingEnabled -XX:+UseParNewGC -XX:-OmitStackTraceInFastThrow -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSInitiatingOccupancyOnly -Djava.awt.headless=true  -XX:+UseStringDeduplication -XX:+UseStringCache -Xms512m -Xmx16g -server"

docker run \
             -e "SET_CONTAINER_TIMEZONE=true" \
            -e "CONTAINER_TIMEZONE="$4 -e TZ=$4 -e JAVA_OPTS="$OPTS" -Pd -p $3 --name $1 $2
