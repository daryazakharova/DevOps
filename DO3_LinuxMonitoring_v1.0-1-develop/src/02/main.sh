#!/bin/bash

source "get_info.sh"
source "write_file.sh"

#проверка на ввод без параметров
if [ "$#" -eq 0 ]; then
get_information
write_file
else
   echo "The script must be run without parameters."
fi


