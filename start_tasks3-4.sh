#!/bin/bash
sudo docker run -d -p 8080:8080 -p 50000:50000 --name jenkins -v $(pwd)/jenkins_data:/var/jenkins -v /var/run/docker.sock:/var/run/docker.sock dockerdar/jenkins
