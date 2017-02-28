#!/bin/bash

DOCKER_IP=$(docker info | grep "Node Address" | awk ' {print $3} ')
docker run -d --name=consul --net=host gliderlabs/consul-server -advertise=$DOCKER_IP -bootstrap
docker run -d --name=registrator --net=host --volume=/var/run/docker.sock:/tmp/docker.sock gliderlabs/registrator:latest consul://$DOCKER_IP:8500

docker run -d -P --name lolek.1 dockerdar/lolek:latest
docker run -d -P --name lolek.2 dockerdar/lolek:latest

docker run -d -P --name bolek.1 dockerdar/bolek:latest
docker run -d -P --name bolek.2 dockerdar/bolek:latest

docker run -p 80:80 --name balancer -e CONSUL_URL=$DOCKER_IP -d dockerdar/balancer


