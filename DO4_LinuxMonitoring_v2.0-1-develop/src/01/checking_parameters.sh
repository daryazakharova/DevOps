#!/bin/bash

check_parameters(){
#проверкa на:
#1 - это абсолютный путь. /opt/test
if [ ! -d "$1" ]; then
  echo "ERROR:The directory $1 does not exist."
  exit 1
fi
if ! [[ "$1" == */ ]]; then
echo "ERROR:The path must end the introduction '/'"
exit 1
fi
#2 - количество вложенных папок number
#4 - количество файлов в каждой созданной папке.
if ! [[ $2 =~ ^[1-9]+$ && $4 =~ ^[1-9]+$ ]]; then
    echo "ERROR:The second and fourth parameters must be numeric."
    echo "The number of folders cannot be 0."
    exit 1
fi
#3 - список букв английского алфавита,не более 7 знаков
if ! [[ $3 =~ ^[a-zA-Z]{1,7}$ ]]; then
    echo "When entering a folder name, use English letters (no more than 7 characters)."
    exit 1
fi
#5 - список букв английского алфавита,не более 7 знаков для имени, не более 3 знаков для расширения
if ! [[ $5 =~ ^[a-zA-Z]{1,7}[.][a-zA-Z]{1,3}$ ]]; then
    echo "ERROR:When entering a file name, use letters of the English alphabet (no more than 7 characters for the name, no more than 3 characters for the extension)."
    exit 1
fi
#6 - размер файлов (в килобайтах, но не более 100)-3kb
if ! [[ $6 =~ ^([1-9]+|100)kb$ ]]; then
    echo "ERROR:When entering a file size, use format in kilobytes, but not 0 or more than 100."
    exit 1
fi
}
