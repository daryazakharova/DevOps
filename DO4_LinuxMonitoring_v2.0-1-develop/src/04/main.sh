#!/bin/bash
source "gen_info.sh"

#Combined Log Format  "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-agent}i\""
#"%h                  Имя хоста или IP-адрес пользователя 
#%l                   идентификатор клиента в файле обозначается дефисом (-)
#%u                   Имя пользователя, осуществляющего доступ к документу; будет дефисом (-)
#%t                   Строка временной метки[12/Dec/2012:12:12:12 -0500] 
#\"%r\"               HTTP-запрос
#%>s                  Код состояния HTTP:200,404
#%b                   Количество байтов, переданных в запрошенном объекте
#\"%{Referer}i\"      Реферер: URL-адрес, откуда пользователь пришел 
#\"%{User-agent}i\""  Строка пользовательского агента

if [[ $# == 0 ]]; then
for day in {1..5}; do
number_records=$(shuf -i 100-1000 -n 1)
    for ((i=0; i<$number_records; i++)); do
	    h=$(ip_info)
	    l=$(echo "-")
	    u=$(echo "-")
	    t="$(timestamp)"
	    r=$(http_request)
	    s=$(status_code)
	    b=$(number_bytes)
	    Referer=$(referer)
	    User_agent=$(user_agent)
        echo "$h $l $u [$t] \"$r\" $s $b \"$Referer\" \"$User_agent\"" >> nginx_${day}.log
    done
done
else
echo "ERROR:The script is run without arguments"
fi
