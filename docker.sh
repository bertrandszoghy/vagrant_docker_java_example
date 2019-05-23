#!/bin/bash

# will be run in /home/vagrant/dockerjava

# ~/bo defined in Java src application.properties resides in the container under /root
# To open a prompt in the jingju container:
# sudo docker exec -t -i `sudo docker container ls | grep jingju | awk '{print $1}'` sh
docker run -v h20-data:/root -p 8080:8080 -t jingju
