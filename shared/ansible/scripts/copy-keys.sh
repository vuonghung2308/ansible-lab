#! /bin/bash

sudo mount -t vboxsf vagrant /vagrant
sudo mkdir -p /home/vagrant/ansible/keys
sudo cp /vagrant/keys/* /home/vagrant/ansible/keys/
sudo chown -R vagrant:vagrant /home/vagrant/ansible/keys
sudo chmod 600 /home/vagrant/ansible/keys/*