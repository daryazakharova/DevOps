#!/bin/bash

source "config.conf"

read_config(){
export background_1=$column1_background
export font_1=$column1_font_color
export background_2=$column2_background
export font_2=$column2_font_color  
}

name_color() {
if [[ $1 == 1 ]]; then
    echo "white"
elif [[ $1 == 2 ]]; then
    echo "red"
elif [[ $1 == 3 ]]; then
    echo "green"
elif [[ $1 == 4 ]]; then
    echo "blue"
elif [[ $1 == 5 ]]; then
    echo "purple"
elif [[ $1 == 6 ]]; then
    echo "black"
fi
}

print_scheme(){
if [[ -z "$background_1" ]] || [[ -z "$font_1" ]] || [[ -z "$background_2" ]] || [[ -z "$font_2" ]]; 
then 
    echo "Column 1 background = default ($(name_color 4))"
    echo "Column 1 font color = default ($(name_color 1))"
    echo "Column 2 background = default ($(name_color 5))"
    echo "Column 2 font color = default ($(name_color 1))"
else
    echo "Column 1 background = $background_1 ($(name_color $background_1))"
    echo "Column 1 font color = $font_1 ($(name_color $font_1))"
    echo "Column 2 background = $background_2 ($(name_color $background_2))"
    echo "Column 2 font color = $font_2 ($(name_color $font_2))"
fi   
}

print_scheme2(){
if [[ -z "$background_1" ]];then
    echo "Column 1 background = default ($(name_color 4))"
else 
    echo "Column 1 background = $background_1 ($(name_color $background_1))"
fi
if [[ -z "$font_1" ]];then
    echo "Column 1 font color = default ($(name_color 1))"
else
    echo "Column 1 font color = $font_1 ($(name_color $font_1))"
fi 
if [[ -z "$background_2" ]];then
    echo "Column 2 background = default ($(name_color 5))"
else
    echo "Column 2 background = $background_2 ($(name_color $background_2))"
fi 
if [[ -z "$font_2" ]];then
    echo "Column 2 font color = default ($(name_color 1))"
else
    echo "Column 2 font color = $font_2 ($(name_color $font_2))"
fi   
}


