#!/bin/bash

ip_info() {
    echo "$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1)"
}

timestamp(){
echo "$(date -d "today - $((5 - ${day})) days" "+%d/%b/%Y:%H:%M:%S %z")"
}

http_request(){
methods=("GET" "POST" "PUT" "PATCH" "DELETE")
requested_file=("/send-message.html" "/receive-message.htm" "/put-bag.html" "/img_index/67891.jpg" "/img_index/12345.jpg" )
protocol=("HTTP/1.0" "HTTP/1.1" "HTTP/2")
echo "$(shuf -e ${methods[*]} -n 1) $(shuf -e ${requested_file[*]} -n 1) $(shuf -e ${protocol[*]} -n 1)"
}

#HTTP status code:
#2xx: Success (успешно): 
#200 OK (хорошо)
#201 Created (создано)

#4xx: Client Error (ошибка клиента): 
#400 Bad Request (неправильный, некорректный запрос)
#401 Unauthorized (не авторизован (не представился))
#403 Forbidden (запрещено (не уполномочен))
#404 Not Found (не найдено)

#5xx:Server Error (ошибка сервера): 
#500 Internal Server Error (внутренняя ошибка сервера)
#501 Not Implemented (не реализовано)
#502 Bad Gateway (плохой, ошибочный шлюз)
#503 Service Unavailable (сервис недоступен)

status_code() {
status=("200" "201" "400" "401" "403" "404" "500" "501" "502" "503")
 echo "$(shuf -e ${status[*]} -n 1)"   
}

number_bytes(){
echo "$(shuf -i 11-999 -n 1)"
}

referer(){
refer=("-" "http://google.com" "https://vk.com" "http://yandex.ru" "https://www.wildberries.ru")
echo "$(shuf -e ${refer[*]} -n 1)"
}

user_agent(){
agents=('Mozilla' 'Google Chrome' 'Opera' 'Safari' 'Internet Explorer' 'Microsoft Edge' 'Crawler and bot' 'Library and net tool')
echo "${agents[RANDOM % ${#agents[*]}]}"
}
