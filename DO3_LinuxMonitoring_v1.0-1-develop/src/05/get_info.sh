#!/bin/bash

get_executable_files(){
exe_files=$(find $1 -type f -executable 2>/dev/null | sort -n | head -n 10)
if [[ -z "$exe_files" ]]; then
  echo "No executable files found in directory."
fi
  number=1
for file in $exe_files
do  
  size=$(du -BM  $file {} +  2>/dev/null | awk '{print $2", "$1}')
  hash=$(md5sum $file | awk '{print $1}')
  echo "$number - $size, $hash"
  number=$(($number + 1))
done
}

get_information() {
echo "Total number of folders (including all nested ones) =  $(ls -laR $1 2>/dev/null| grep ^d | wc -l)"
echo "TOP 5 folders of maximum size arranged in descending order (path and size): "
echo "$(du -Sh $1 2>/dev/null| sort -rh | head -n 5 | cat -n | awk '{print $1" - "$3", "$2}')"
echo "Total number of files =  $(ls -laR $1 2>/dev/null| grep "^-" | wc -l)"
echo "Number of: "
echo "Configuration files (with the .conf extension) = $(ls -laR $1 2>/dev/null | grep ".conf"| wc -l)"
echo "Text files = $(ls -laR $1 2>/dev/null | grep ".txt"| wc -l)"
echo "Executable files = $(ls -laR $1 2>/dev/null | grep ".exe"| wc -l)"
echo "Log files (with the extension .log) = $(ls -laR $1 2>/dev/null | grep ".log"| wc -l)"
echo "Archive files = $(find $1 -regex '.*\(tar\|zip\|gz\|rar\|apkg\)' 2>/dev/null | wc -l )"
echo "Symbolic links = $(ls -laR $1 2>/dev/null | grep ^l | wc -l)"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type): "
echo "$(find $1 -type f -exec du -hS {} + 2>/dev/null | sort -rh | head -n 10| cat -n |awk '{print $1" - "$3", "$2", "$3}' | sed -e 's/, \(\.\|\/\).*\./ /' )\n"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file): "
(get_executable_files $1) 
}
