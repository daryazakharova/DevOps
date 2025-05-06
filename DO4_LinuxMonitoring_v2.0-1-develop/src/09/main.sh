#!/bin/bash

if [[ $# == 0 ]]; then
if ! [[ -n $(dpkg -l | grep nginx) ]]; then 
sudo apt install -y nginx
fi

chmod +x gen_info.sh
. ./gen_info.sh

sudo cp nginx.conf /etc/nginx/nginx.conf 
sudo nginx -s reload

sudo cp index.html /usr/share/nginx/html/index.html

sudo cp prometheus.yml /etc/prometheus/prometheus.yml
sudo systemctl restart prometheus 

while sleep 3
do
    ./gen_info.sh > index.html
done
else
    echo "ERROR:The script is run without arguments" 
fi

