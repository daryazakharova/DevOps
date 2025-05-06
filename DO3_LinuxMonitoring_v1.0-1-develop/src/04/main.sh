#!/bin/bash

source "config.conf"
source "get_info.sh"
source "print_color.sh"
source "color_scheme.sh"

#проверка на ввод без параметров
if [ "$#" -eq 0 ]; then
   read_config
if [[ "$background_1" == "$font_1" || "$background_2" == "$font_2" ]]; 
then  
    echo "The font and background colours of one column must not match. Try again call script!" 
    exit 1
fi
   get_information 
if [[ -z "$background_1" ]] || [[ -z "$font_1" ]] || [[ -z "$background_2" ]] || [[ -z "$font_2" ]]; 
then
   (print_info 4 1 5 1)
else 
   (print_info $background_1 $font_1 $background_2 $font_2)
fi
   (print_scheme $background_1 $font_1 $background_2 $font_2)
else
   echo "The script must be run without parameters."
fi
