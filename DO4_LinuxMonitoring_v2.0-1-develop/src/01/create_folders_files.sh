#! /bin/bash

#проверкa свободного места
free_mem() {
size_mem=$(df --output=avail / | tail -1)
if [[ $size_mem -le 1048576 ]]; then
  echo "1 GB of free space left. More space is needed to continue."
  exit
fi
}

create(){
>>log_file.txt
path="$1"
folders="$2"
folders_symbol="$3"
files="$4"
files_name="${5%.*}"
files_ext="${5#*.}"
size="${6%kb}"
date="$(date +%d%m%y)"
date_log="$(date +%d.%m.%y)"
fold_count=0
fil_count=0
#если длина части имени < 4 знаков
while [[ ${#folders_symbol} -lt 4 ]]; do
  folders_symbol=$folders_symbol${folders_symbol: -1}
done
while [[ ${#files_name} -lt 4 ]]; do
  files_name=$files_name${files_name: -1}
done
base_files_name=$files_name
#создание папок и файлов, запись лог файла
for (( i = 0; i < $folders; i++)); do
free_mem
sudo mkdir ${path}${folders_symbol}_${date} 2>/dev/null
echo "Directory: ${path}${folders_symbol}_${date}">>log_file.txt
  for (( j = 0; j < $files; j++)); do
  free_mem
  sudo fallocate -l $size"KB" ${path}${folders_symbol}_${date}/${files_name}_${date}.${files_ext} 2>/dev/null
  echo "File: ${path}${folders_symbol}_${date}/${files_name}_${date}.${files_ext} ${date_log} ${size}KB">>log_file.txt
  files_name=$files_name${files_name: -1}
  done
files_name=$base_files_name
folders_symbol=$folders_symbol${folders_symbol: -1}
done
}
