# vagrant_docker_java_example
An example of compiling a provided Java Spring Boot application and including it into a Docker container which will be compiled, run and tested in a web browser on the host machine. The Docker container will be running on a Centos 7.6 Linux virtual machine in turn part of a virtual network of Oracle Virtualbox VMs orchestrated by the Vagrant tool on a host Windows 10 laptop. Everything is installed from scratch as the starting point of a continuous delivery system. In addition and as an aside, an Ansible playbook also sets up and configures an Apache web server along with port mapping to the host.

You can view a demo of this code on Youtube at https://youtu.be/tehnIInLxns

To use this code, you will need an internet-enabled computer with at least 4 GB of RAM, Vagrant, Oracle Virtualbox and a Linux prompt (Cygwin on Windows). If you are a Windows 7 or 10 user and have Administrator privileges, see my Powershell script companion project on Github which will set these up for you with minimum hassle.

See the how-to.txt file for additional technical details.

After viewing the video demo, if you are confused but eager to learn more, I recommend the Pluralsight courses on Vagrant and Docker by Wes Higbee, Ansible by Aaron Paxson, and Cloud Deployment by Justin Menga.
