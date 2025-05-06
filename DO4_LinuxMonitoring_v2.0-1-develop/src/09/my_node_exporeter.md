## **My node_exporter**

- Написаны bash-скрипты:   
   - `gen_info.sh`, который собирает информацию по базовым метрикам системы (ЦПУ, оперативная память, жесткий диск (объем)).   
   - `main.sh` для установки nginx, редактирования конфигурационных файлов Prometheus и nginx. Скрипт формирует html-страницу index.html по формату Prometheus, которую будет отдавать nginx. Страница обновляется внутри bash-скрипта main.sh в цикле каждые 3 сек.  


- Соединяем виртуальную машину с компьтером:  
`ssh -L 9090:localhost:9090 -L 3000:localhost:3000 -L 8080:localhost:8080 daariopa@192.168.0.103`  
- Запустим скрипт и проверим, изменения в конфигурационных файлах:  
nginx.conf:  
![nginx.conf](image/1.png)  
рrometheus.yml:  
![рrometheus.yml](image/2.png)  
- Проверяем, что по адресу http://localhost:9090/ (Prometheus) появился новый источник данных   
![localhost:9090](image/3.png)  
- Проверяем, что по адресу http://localhost:8080/ nginx сервер отдает html-страницу с новыми метриками  
![localhost:8080](image/4.png)  
- Переходим по адресу http://localhost:3000/ (Grafana) и создаем новый дашборд с использованием собственных метрик  
- Запускаем bash-скрипт из Части 2  
![localhost:3000](image/6.png)  
- stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 60s  
![localhost:3000](image/7.png)  




