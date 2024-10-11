#! /bin/bash

cp /vagrant/grub /etc/default/grub
cp /vagrant/interfaces/db-server /etc/network/interfaces

apt update -y && apt upgrade -y
apt install python3 vim -y

update-grub
reboot