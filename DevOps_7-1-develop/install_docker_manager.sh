#!/bin/bash

echo "Installing dependencies ..."
sudo apt-get update

echo "Installing Docker..."
curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker $(whoami)
docker-compose --version

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

echo "Initializing Docker Swarm..."
IP=$(hostname -I | awk '{print $2}')
echo $IP > /vagrant/manager_ip.txt
sudo docker swarm init --listen-addr $IP:2377 --advertise-addr $IP:2377

SWARM_TOKEN=$(sudo docker swarm join-token -q worker)
echo "$SWARM_TOKEN" > /vagrant/token.txt

#генерирует токен соединения для узлов, используя токен docker swarm join-token с флагом -q 
#для отключения вывода, и сохраняет его в переменной SWARM_TOKEN 
