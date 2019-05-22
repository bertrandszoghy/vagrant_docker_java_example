#!/bin/bash

echo " "
echo "***"
echo "Installing extra repository" 
echo "***"
echo " "
sudo yum install -y epel-release
sudo yum repolist

echo " "
echo "***"
echo "Installing Ansible" 
echo "***"
echo " "
sudo yum install -y ansible
echo " "
echo "***"
echo "Display AAnsible version" 
echo "***"
echo " "
ansible --version

echo " "
echo "***"
echo "Installing Docker" 
echo "***"
echo " "
# https://linuxize.com/post/how-to-install-and-use-docker-on-centos-7/
sudo yum update
sudo yum install -y yum-utils device-mapper-persistent-data lvm2 wget maven java-1.8.0-openjdk-devel
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
echo " "
echo "***"
echo "Display Docker version" 
echo "***"
echo " "
docker -v
sudo usermod -aG docker $USER
echo " "
echo "***"
echo "Testing Docker" 
echo "***"
echo " "
sudo docker container run hello-world

echo " "
echo "***"
echo "Installing Docker-compose" 
echo "***"
echo " "
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo " "
echo "***"
echo "Display Docker-compose version" 
echo "***"
echo " "
docker-compose --version

echo " "
echo "***"
echo "Copy ansible work folder" 
echo "***"
echo " "
sudo cp -r /vagrant/ansible-work /home/vagrant/
sudo chown -R vagrant:vagrant /home/vagrant/ansible-work

echo " "
echo "***"
echo "First SSH connections between vms" 
echo "***"
echo " "
# avoid message Permission denied (publickey,gssapi-keyex,gssapi-with-mic)
sudo chmod 666 /etc/ssh/sshd_config
sudo echo "PasswordAuthentication yes" >>  /etc/ssh/sshd_config
sudo service sshd restart
sudo chmod 600 /etc/ssh/sshd_config

# next command will store the keys
sudo ssh -tt -o "StrictHostKeyChecking no" vagrant@192.168.33.20
sudo ssh -tt -o "StrictHostKeyChecking no" vagrant@192.168.33.30

echo " "
echo "***"
echo "Run ansible playbook" 
echo "***"
echo " "
cd /home/vagrant/ansible-work/
sudo ansible-playbook web_db.yaml

echo " "
echo "***"
# 8080 must match the host port in the Vagrantfile for 192.168.33.20
echo "You can test the successful Ansible deploy at http://localhost:8080" 
echo "***"
echo " "

echo " "
echo "***"
echo "Configure Maven" 
echo "***"
echo " "
sudo cp /vagrant/maven.sh /etc/profile.d/maven.sh
sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh

echo " "
echo "***"
echo "Testing Java" 
echo "***"
echo " "
java -version
javac -version
mvn -version

echo " "
echo "***"
echo "Copy Java project" 
echo "***"
echo " "
sudo cp -r /vagrant/BeijingOpera /home/vagrant/
sudo chown -R vagrant:vagrant /home/vagrant/BeijingOpera

echo " "
echo "***"
echo "Compile Java project" 
echo "***"
echo " "
cd /home/vagrant/BeijingOpera
mvn clean install

echo " "
echo "***"
echo "Create Docker project" 
echo "***"
echo " "
mkdir /home/vagrant/dockerjava
sudo cp /vagrant/Dockerfile /home/vagrant/dockerjava/Dockerfile
sudo cp /vagrant/docker.sh /home/vagrant/dockerjava/start.sh
sudo chown vagrant:vagrant /home/vagrant/dockerjava/*
sudo chmod 777 /home/vagrant/dockerjava/start.sh
cp /home/vagrant/BeijingOpera/target/BeijingOpera-0.0.1-SNAPSHOT.jar /home/vagrant/dockerjava/

echo " "
echo "***"
echo "Compile Docker project" 
echo "***"
echo " "
cd /home/vagrant/dockerjava/
sudo docker build -t jingju . 

echo " "
echo "***"
echo "Run Docker project" 
echo "***"
echo " "
cd /home/vagrant/dockerjava/
sudo ./start.sh &

echo " "
echo "***"
echo "You can test the Java Docker deploy at http://localhost:8080 on your host computer" 
echo "You can test the Apache web server deploy on the web VM at http://localhost:8090 on your host computer" 
echo "To stop docker: "
echo "vagrant ssh ans"
echo "sudo docker container ls"
echo "sudo docker container stop XX where XX is the first two characters of the hex codefor the jingju image"
echo "***"
echo " "

