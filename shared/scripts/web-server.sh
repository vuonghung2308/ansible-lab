#! /bin/bash

cp /vagrant/grub /etc/default/grub
cp /vagrant/interfaces/web-server /etc/network/interfaces

apt update -y && apt upgrade -y
apt install python3 vim -y

update-grub
reboot