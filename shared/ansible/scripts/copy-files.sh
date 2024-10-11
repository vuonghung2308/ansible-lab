#! /bin/bash

sudo mount -t vboxsf vagrant /vagrant
sudo cp -rf /vagrant/ansible/* /home/vagrant/ansible/