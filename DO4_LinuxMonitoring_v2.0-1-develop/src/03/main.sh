#! /bin/bash

source "clear_log.sh"
source "clear_date.sh"
source "clear_mask.sh"

if [[ $# -eq 1 ]]; then
if [[ $1 -eq 1 ]]; then
  echo "Cleaning by log file"
  by_log_file
elif [[ $1 -eq 2 ]]; then
  echo "Cleaning by date"
  by_date_time
elif [[ $1 -eq 3 ]]; then
  echo "Cleaning by mask"
  by_name_mask
else
 echo "ERROR:You must enter numeric parameter(1 or 2 or 3)"
 fi
else
  echo "ERROR:You must enter one numeric parameter(1 or 2 or 3)"
fi