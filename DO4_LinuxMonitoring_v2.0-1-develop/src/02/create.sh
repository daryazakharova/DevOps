#! /bin/bash

#проверкa свободного места
free_mem(){
size_mem=$(df -h --output=avail / | tail -1)
if [[ ${size_mem: -1} == "M" ]]; then
  echo "1 GB of free space left. More space is needed to continue."
  exit
fi
}


folder_name="$1"
file_name="${2%.*}"
file_ext="${2#*.}"
size="${3%Mb}"
date="$(date +%d%m%y)"
date_log="$(date +%d.%m.%y)"
#если длина части имени < 5 знаков
while [[ ${#folder_name} -lt 5 ]]; do
  folder_name=$folder_name${folder_name: -1}
done
while [[ ${#file_name} -lt 5 ]]; do
  file_name=$file_name${file_name: -1}
done
base_file_name=$file_name
#случайное число для каждой папки 
count_fold="$(shuf -i 1-100 -n 1)"

for (( i = 0; i < $count_fold; i++ )); do
free_mem
random_path="$(compgen -d / | grep -v -e "bin" -e "sbin" | shuf -n 1)"
sudo mkdir -m777 ${random_path}/${folder_name}_${date} 2>/dev/null
echo "Directory: ${random_path}/${folder_name}_${date}">>file_log.txt
count_file="$(shuf -i 1-100 -n 1)"
  for (( j = 0; j < $count_file; j++ )); do
    free_mem
    sudo fallocate -l $size"MB" ${random_path}/${folder_name}_${date}/${file_name}_${date}.${file_ext} 2>/dev/null
    #sudo chmod 744 ${random_path}/${folder_name}_${date}/${file_name}_${date}.${file_ext} 2>/dev/null
    echo "File: ${random_path}/${folder_name}_${date}/${file_name}_${date}.${file_ext} ${date_log} ${size}Mb">>file_log.txt
    file_name=$file_name${file_name: -1}
  done
file_name=$base_file_name
folder_name=$folder_name${folder_name: -1}
done