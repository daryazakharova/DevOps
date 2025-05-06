#!/bin/bash

get_information() {
echo "HOSTNAME = $HOSTNAME" 
echo "TIMEZONE = $(cat /etc/timezone)  $(date +"UTC %-:::z")"
echo "USER = $(whoami)"
echo "OS = $(cat /etc/issue.net) $(uname -mrs)" 
echo "DATE = $(date +"%d %b %Y %H:%M:%S")"
echo "UPTIME = $(uptime -p)"
echo "UPTIME_SEC = $(awk '{print $1}' /proc/uptime)"
echo "IP = $(hostname -I)"
echo "MASK = $(netstat -r | tail -n 1 | awk '{print $3}')"
echo "GATEWAY = $(ip route list | awk '/default/{print$3}')"
echo "RAM_TOTAL = $(free | grep -P 'Mem|Память' | awk '{printf "%.3f GB\n", $2/1024}')"
echo "RAM_USED = $(free | grep -P 'Mem|Память' | awk '{printf "%.3f GB\n", $3/1024}')"
echo "RAM_FREE = $(free | grep -P 'Mem|Память' | awk '{printf "%.3f GB\n", $4/1024}')"
echo "SPACE_ROOT = $(df | grep '/$' | awk '{printf "%.2f MB\n", $2/1024}')"
echo "SPACE_ROOT_USED = $(df | grep '/$' | awk '{printf "%.2f MB\n", $3/1024}')"
echo "SPACE_ROOT_FREE = $(df | grep '/$' | awk '{printf "%.2f MB\n", $4/1024}')"
}

