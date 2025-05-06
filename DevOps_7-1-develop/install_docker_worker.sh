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
JOIN_TOKEN=$(cat /vagrant/token.txt)
MANAGER_IP=$(cat /vagrant/manager_ip.txt)
docker swarm join --token "$JOIN_TOKEN" "$MANAGER_IP:2377"
 

