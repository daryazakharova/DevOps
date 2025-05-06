#!/bin/bash

source "get_info.sh"

get_start=$(date +%s)
#проверкa на некорректный ввод (не указан параметр, > 1 параметр)
if [ "$#" -lt 1 ]; then
    echo "ERROR: No parameters found."
    exit 1
fi
if [ "$#" -gt 1 ]; then
    echo "ERROR: One parameter required."
    exit 1
fi
if [[ "$1" == */ ]]; then
if [[ -d "$1" ]]; then
   (get_information $1)
   end=$(date +%s)
   echo "Script execution time (in seconds) = $(($end - $get_start))"
else
   echo "ERROR: No such directory exists."
fi
else
   echo "ERROR: The parameter must end the introduction '/'"
fi