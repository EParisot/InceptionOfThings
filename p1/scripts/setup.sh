# this script is not run because it does not make sense to download 500M and
# unpack it twice

yum update -y && yum install -y net-tools && curl -sfL https://get.k3s.io | sh -
# todo: ajouter les guest additions dans la 0.1.1

# It was added to https://app.vagrantup.com/mehdee/boxes/k3s_one
# Vagrant directly pulls it, with the configuration files in ../confs
# Commands to setup the box in the Vagrant cloud, are detailed in notes.md
