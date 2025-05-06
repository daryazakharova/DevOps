#!/bin/bash

source "get_info.sh"

# 1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black
font_color(){
if [[ $1 == 1 ]]; then
    echo "\033[97m"
elif [[ $1 == 2 ]]; then
    echo "\033[31m"
elif [[ $1 == 3 ]]; then
    echo "\033[32m"
elif [[ $1 == 4 ]]; then
    echo "\033[34m"
elif [[ $1 == 5 ]]; then
    echo "\033[35m"
elif [[ $1 == 6 ]]; then
    echo "\033[30m"
fi
}

background_color(){
if [[ $1 == 1 ]]; then
    echo "\033[107m"
elif [[ $1 == 2 ]]; then
    echo "\033[41m"
elif [[ $1 == 3 ]]; then
    echo "\033[42m"
elif [[ $1 == 4 ]]; then
    echo "\033[44m"
elif [[ $1 == 5 ]]; then
    echo "\033[45m"
elif [[ $1 == 6 ]]; then
    echo "\033[40m"
fi
}

print_info(){
background_one=$(background_color $1)
font_one=$(font_color $2) 
background_two=$(background_color $3) 
font_two=$(font_color $4) 
end="\033[0m"
echo -e "${background_one}${font_one}HOSTNAME = ${background_two}${font_two}$HOSTNAME${end}"
echo -e "${background_one}${font_one}TIMEZONE = ${background_two}${font_two}$TIMEZONE${end}"
echo -e "${background_one}${font_one}USER = ${background_two}${font_two}$USER${end}"
echo -e "${background_one}${font_one}OS = ${background_two}${font_two}$OS${end}"
echo -e "${background_one}${font_one}DATE = ${background_two}${font_two}$DATE${end}"
echo -e "${background_one}${font_one}UPTIME = ${background_two}${font_two}$UPTIME${end}"
echo -e "${background_one}${font_one}UPTIME_SEC = ${background_two}${font_two}$UPTIME_SEC${end}"
echo -e "${background_one}${font_one}IP = ${background_two}${font_two}$IP${end}"
echo -e "${background_one}${font_one}MASK = ${background_two}${font_two}$MASK${end}"
echo -e "${background_one}${font_one}GATEWAY = ${background_two}${font_two}$GATEWAY${end}"
echo -e "${background_one}${font_one}RAM_TOTAL = ${background_two}${font_two}$RAM_TOTAL${end}"
echo -e "${background_one}${font_one}RAM_USED = ${background_two}${font_two}$RAM_USED${end}"
echo -e "${background_one}${font_one}RAM_FREE = ${background_two}${font_two}$RAM_FREE${end}"
echo -e "${background_one}${font_one}SPACE_ROOT = ${background_two}${font_two}$SPACE_ROOT${end}"
echo -e "${background_one}${font_one}SPACE_ROOT_USED = ${background_two}${font_two}$SPACE_ROOT_USED${end}"
echo -e "${background_one}${font_one}SPACE_ROOT_FREE = ${background_two}${font_two}$SPACE_ROOT_FREE${end}"
echo ""
}
