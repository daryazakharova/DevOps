#!/bin/bash

by_log_file() {
log_file="../02/file_log.txt"
  if [[ ! -f "$log_file" ]]; then
    echo "ERROR:Log file not found!"  
    exit 1  
  fi
delete="$(grep "Directory:" ../02/file_log.txt | awk '{print $2}')"
for i in $delete; do
  sudo rm -rf $i 2>/dev/null
done
}
