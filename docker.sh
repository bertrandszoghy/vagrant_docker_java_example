#!/bin/bash

# will be run in /home/vagrant/dockerjava

# this next line will create a volume to persist data on the host ans VM
docker volume create h20-data 
docker run -v h20-data:/home/vagrant/dockerjava/h20-data -p 8080:8080 -t jingju
