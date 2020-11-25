#!/bin/bash

#------------------------RUN----------------------#
# bash createUsers.sh firstname.lastname my-public-key.pub existingUser existingUserKey
# where "firstname.lastname" is the new user you want to create
# specify the path to the keys or move them into the same folder and just name them
# make sure list-of-vm-dns.txt is also in same folder os specify path

SCRIPT="sudo useradd -s /bin/bash -d /home/$1/ -m -G sudo $1; sudo mkdir /home/$1/.ssh; sudo chmod 0700 /home/$1/.ssh/; sudo -- sh -c \"echo $(cat $2) > /home/$1/.ssh/authorized_keys\"; sudo chown -R $1:$1 /home/$1/.ssh; echo '$1 ALL=(ALL) NOPASSWD:ALL' | sudo EDITOR='tee -a' visudo"

for line in $(cat list-of-vms-dns.txt) ; do
	echo "Login attempt ${line} ----------------------------"
	ssh -i $4 $3@${line} ${SCRIPT}
done
