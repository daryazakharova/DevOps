#!/bin/bash
>file_log.txt

chmod +x check_parameters.sh

start_date="$(date +"%d.%m.%y %H:%M:%S")"
get_start="$(date +%s)"

#./main.sh az az.az 3Mb
if [[ "$#" -ne 3 ]]; then
    echo "ERROR:You are required to enter 3 parameters!"
    echo "Sample: ./main.sh az az.az 3Mb"
else
./check_parameters.sh $1 $2 $3

end="$(date +%s)"
end_date="$(date +"%d.%m.%y %H:%M:%S")"
echo "Start: $start_date"
echo "Start: $start_date" >> file_log.txt
echo "Finish: $end_date"
echo "Finish: $end_date" >> file_log.txt
echo "Script execution time (in seconds) = $(($end - $get_start))"
echo "Script execution time (in seconds) = $(($end - $get_start))" >> file_log.txt
fi  