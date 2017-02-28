#!/bin/bash
sudo docker rm -f `docker ps -qa`
sudo docker rmi -f dockerdar/bolek
sudo docker rmi -f dockerdar/lolek
