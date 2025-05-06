#!/bin/bash

by_name_mask() {
read -p "Enter the name mask to delete: symbols, underscore and date(azzzzz_051223): " name_mask
#не пустая ли маска имени
  if [[ -z "$name_mask" ]]; then
    echo "Error:Name mask cannot be empty!"
    exit 1
  fi
  if [[ "$name_mask" =~ '^[a-zA-Z]{1,7}_[0-3][0-9][0-1][0-9]{3}$' ]]; then
    echo "Error:Invalid name mask format!"
    exit 1
  fi
symbols_mask=$(echo $name_mask | cut -d "_" -f1 )
date_mask=$(echo $name_mask | cut -d "_" -f2 )
reg_symbol=$(echo "^[$symbols_mask]+$")
reg_date=$(echo "*_$date_mask")
for delete_folder in $(sudo find / -type d -name $reg_date 2>/dev/null)
    do
        delete_pwd=${delete_folder##*/}
        name_folder=${delete_pwd%_*}
        if [[ $name_folder =~ $reg_symbol ]]; then
        sudo rm -rf $delete_folder
        fi 
    done
}

