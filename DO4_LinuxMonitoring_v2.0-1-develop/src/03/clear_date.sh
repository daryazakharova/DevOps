#!/bin/bash

by_date_time() {
read -p "Enter start time (Format: YYYY-mm-dd HH:MM): " start_time  
read -p "Enter finish time (Format: YYYY-mm-dd HH:MM): " finish_time 
  if [[ ! $start_time =~ ^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])\ (0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$ ]]; then
    echo "Error:Invalid start time format!"
    exit 1
  fi
  if [[ ! $finish_time =~ ^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])\ (0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$ ]]; then
    echo "Error:Invalid finish time format!"
    exit 1
  fi
  reg_folder='[a-zA-Z]{4,}_[[:digit:]]{6}'
  for delete_folder in $(sudo find / -maxdepth 3 -type d -newermt "$start_time" ! -newermt "$finish_time" 2>/dev/null)
    do
        if [[ $delete_folder =~ reg_$folder ]]; then
        sudo rm -rf $delete_folder
        fi
    done
}
