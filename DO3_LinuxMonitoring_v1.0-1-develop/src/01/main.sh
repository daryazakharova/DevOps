#!/bin/bash

#проверкa на некорректный ввод (не указан параметр, > 1 параметр, параметр текстовый)
regex="^[-]?[[:digit:]]+([.][[:digit:]]+)?$" 
regex2="."
if [ "$#" -lt 1 ]; then
    echo "ERROR: No parameters found."
    exit 1
elif [ "$#" -gt 1 ]; then
    echo "ERROR: One parameter required."
    exit 1
elif [[ "$1" =~ $regex ]]; then  
    echo "ERROR: Enter a text parameter."
    exit 1
elif [[ "$1" =~ $regex2 ]]; then  
    echo "$1"
fi
