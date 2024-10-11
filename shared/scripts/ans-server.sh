#! /bin/bash

cp /vagrant/hosts /etc/hosts
cp /vagrant/grub /etc/default/grub
cp /vagrant/interfaces/ans-server /etc/network/interfaces
cp -r /vagrant/ansible /home/vagrant/ansible
chown -R vagrant:vagrant /home/vagrant/ansible
update-grub

apt update -y && apt upgrade -y
apt install python3 vim -y

sudo -u vagrant -i
curl https://bootstrap.pypa.io/pip/3.5/get-pip.py --output /tmp/get-pip.py
python3 /tmp/get-pip.py
pip install ansible

sudo reboot