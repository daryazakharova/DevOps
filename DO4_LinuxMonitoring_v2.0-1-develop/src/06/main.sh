#!/bin/bash

if [[ $# -eq 1 ]]; then
if ! [[ -n $(dpkg -l | grep goaccess) ]]; then 
echo "" 
echo "deb http://deb.goaccess.io/ $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/goaccess.list
wget -O - https://deb.goaccess.io/gnugpg.key | sudo apt-key --keyring /etc/apt/trusted.gpg.d/goaccess.gpg add -
sudo apt update
sudo apt install goaccess
fi
#после установки:
#cd /etc/goaccess
#sudo vim goaccess.conf
#расскоментировать time-format; date-format; datetime-format; combiened log format
if [[ $1 -eq 1 ]]; then
rm -f response_code.html
goaccess -a -f ../04/*.log  --log-format=COMBINED --sort-panel=STATUS_CODES,BY_DATA,ASC
goaccess ../04/*.log -a > response_code.html --log-format=COMBINED --sort-panel=STATUS_CODES,BY_DATA,ASC
elif [[ $1 -eq 2 ]]; then
rm -f uniq_ip.html
goaccess -a -f ../04/*.log  --log-format=COMBINED --sort-panel=VISITORS,BY_VISITORS,ASC
goaccess ../04/*.log -a > uniq_ip.html --log-format=COMBINED --sort-panel=VISITORS,BY_VISITORS,ASC
elif [[ $1 -eq 3 ]]; then
rm -f requests_errors.html
goaccess -a -f ../04/*.log  --log-format=COMBINED --ignore-status=200 --ignore-status=201
goaccess ../04/*.log -a > requests_errors.html --log-format=COMBINED --ignore-status=200 --ignore-status=201
elif [[ $1 -eq 4 ]]; then
rm -f unique_ip_requests_errors.html
goaccess -a -f ../04/*.log  --log-format=COMBINED --ignore-status=200 --ignore-status=201 \
  --sort-panel=VISITORS,BY_VISITORS,ASC
goaccess ../04/*.log -a > unique_ip_requests_errors.html --log-format=COMBINED --ignore-status=200 --ignore-status=201 \
  --sort-panel=VISITORS,BY_VISITORS,ASC
else
  echo "ERROR:You must enter numeric parameter(1 or 2 or 3 or 4)"
fi
else
  echo "ERROR:You must enter one numeric parameter(1 or 2 or 3 or 4)"
fi
