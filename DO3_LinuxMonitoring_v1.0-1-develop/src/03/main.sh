#!/bin/bash

source "get_info.sh"
source "print_color.sh"

#проверка на 4 параметра, цифры 1-6
if [ "$#" -eq 4 ]; then
    for parametr in "$@"
    do
    if [[ "$parametr" != [1-6] ]] ; then
        printf "Parameters must be from 1 to 6.\n"
        exit 1
    fi
    done
if [[ "$1" == "$2" || "$3" == "$4" ]]; then  
    echo "The font and background colours of one column must not match. Try again call script!" 
    exit 1
fi
get_information
(print_info $1 $2 $3 $4)     
else
    echo "ERROR: You need to enter 4 parameters."
fi
