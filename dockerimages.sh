#!/bin/bash
#
# dockerimages.sh        Startup script for the custom images
#
# Bertrand Szoghy
# last modified: 2019-05-22

start() {
       
		echo -n $"Starting Docker images "
        cd /home/vagrant/dockerjava/
		./start.sh &
        return 0
}

ansible() {
        echo -n $"Starting Ansible playbook "
		cd /home/vagrant/ansible-work/
		ansible-playbook web_db.yaml
        return 0
}


stop() {
	docker container stop `sudo docker container ls | grep jingju | awk '{print $1}'`
	return 0
}

# See how we were called.
case "$1" in
  start)
	start
	;;
  stop)
	stop
	;;
  ansible)
    ansible
	;;
  *)
	echo $"Usage: $prog {start|ansible|stop}"
	exit 1
esac

exit $RETVAL