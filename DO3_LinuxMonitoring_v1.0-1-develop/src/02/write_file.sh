#!/bin/bash

source "get_info.sh"

write_file(){
read -p "Write data to a file(Y/N): " choice
if [[ "$choice" == "Y" || "$choice" == "y" ]]; then
   file_name=$(date +"%d_%m_%Y_%H_%M_%S.status")
   get_information > "$file_name"
   echo "File created"
else
    exit 1
fi
}