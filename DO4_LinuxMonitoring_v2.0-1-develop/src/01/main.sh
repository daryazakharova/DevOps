#!/bin/bash

source "checking_parameters.sh"
source "create_folders_files.sh"

chmod +x checking_parameters.sh
chmod +x create_folders_files.sh

# main.sh /opt/test 4 az 5 az.az 3kb
if [[ "$#" -ne 6 ]]; then
     echo "ERROR:You are required to enter 6 parameters!"
    echo "Sample: main.sh /opt/test 4 az 5 az.az 3kb"
else
check_parameters $1 $2 $3 $4 $5 $6
create $1 $2 $3 $4 $5 $6
fi  

