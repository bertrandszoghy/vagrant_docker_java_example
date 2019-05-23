#!/bin/bash

# will be run in /home/vagrant/dockerjava

# ~/bo defined in Java src application.properties
docker run -v h20-data:/bo -p 8080:8080 -t jingju
