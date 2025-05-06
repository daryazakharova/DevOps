#!/bin/bash

get_information() {
HOSTNAME=$HOSTNAME 
TIMEZONE="$(cat /etc/timezone)  $(date +"UTC %-:::z")"
USER=$(whoami)
OS="$(cat /etc/issue.net) $(uname -mrs)" 
DATE=$(date +"%d %b %Y %H:%M:%S")
UPTIME=$(uptime -p)
UPTIME_SEC=$(awk '{print $1}' /proc/uptime)
IP=$(hostname -I)
MASK=$(netstat -r | tail -n 1 | awk '{print $3}')
GATEWAY=$(ip route list | awk '/default/{print$3}')
RAM_TOTAL=$(free | grep -P 'Mem|Память' | awk '{printf "%.3f GB\n", $2/1024}')
RAM_USED=$(free | grep -P 'Mem|Память' |awk '{printf "%.3f GB\n", $3/1024}')
RAM_FREE=$(free | grep -P 'Mem|Память' |awk '{printf "%.3f GB\n", $4/1024}')
SPACE_ROOT=$(df | grep '/$' | awk '{printf "%.2f MB\n", $2/1024}')
SPACE_ROOT_USED=$(df | grep '/$' | awk '{printf "%.2f MB\n", $3/1024}')
SPACE_ROOT_FREE=$(df | grep '/$' | awk '{printf "%.2f MB\n", $4/1024}')
}