#! /bin/bash

sudo useradd -m colab
sudo adduser colab sudo
echo 'colab:8341' | sudo chpasswd
apt update&& apt -yqq install xfce4 xrdp ssh terminator nano 
echo "StrictHostKeyChecking no" >>/etc/ssh/ssh_config
service ssh restart
service xrdp restart

ssh -CNfg -R 33890:127.0.0.1:3389 ubuntu@52.81.236.29 -i "/content/drive/My Drive/colab.pem"
