#!/bin/bash

chmod +x create.sh
#проверкa на:
#1 - список букв английского алфавита,не более 7 знаков
if ! [[ $1 =~ ^[a-zA-Z]{1,7}$ ]]; then
    echo "When entering a folder name, use English letters (no more than 7 characters)."
    exit 1
fi
#2 - список букв английского алфавита,не более 7 знаков для имени, не более 3 знаков для расширения
if ! [[ $2 =~ ^[a-zA-Z]{1,7}[.][a-zA-Z]{1,3}$ ]]; then
    echo "ERROR:When entering a file name, use letters of the English alphabet (no more than 7 characters for the name, no more than 3 characters for the extension)."
    exit 1
fi
#3 - размер файлов (в Мегабайтах, но не более 100)-3kb
if ! [[ $3 =~ ^([1-9]+|100)Mb$ ]]; then
    echo "ERROR:When entering a file size, use format in Megabytes, but not 0 or more than 100."
    exit 1
fi
./create.sh $1 $2 $3