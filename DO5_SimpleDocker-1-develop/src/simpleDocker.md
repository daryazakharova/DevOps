## Part 1. Готовый докер  

- Установим Docker с помощью скрипта с официального сайта (https://docs.docker.com/engine/install/ubuntu/):  
  - `curl -fsSL https://get.docker.com -o get-docker.sh`  
  - `sudo sh get-docker.sh`  
  ![sh get-docker.sh](image/1.png)  

- Возьмем официальный докер образ с nginx и выкачам его при помощи `sudo docker pull nginx`   
  ![docker pull](image/2.png)  

- Проверим наличие докер образа через `sudo docker images`  
  ![docker images](image/3.png)  

- Запустим докер образ через `docker run -d [image_id|repository]`  
  ![run -d ](image/4.png)  

- Проверим, что образ запустился через `sudo docker ps`  
  ![docker ps](image/5.png)  

- Посмотрим информацию о контейнере через `sudo docker inspect [container_id|container_name]`  
  Вывод команды очень большой, поэтому используем `grep` для получения размера контейнера, списка замапленных портов и ip контейнера  
  ![docker inspect](image/6.png)  

- Остановливаем докер образ через `sudo docker stop 55c5c5b8b3fe`  
  ![docker inspect](image/7.png)  

- Проверим, что образ остановился через `sudo docker ps`  
  ![docker inspect](image/8.png)  

- Запустим докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду run  
`sudo docker run -d -p 80:80 -p 443:443 nginx`  
  ![docker inspect](image/9.png)  

- Проверим, что в браузере по адресу localhost:80 доступна стартовая страница nginx `open http://localhost:80`  
  ![docker inspect](image/10.png)  

- Перезапустим докер контейнер через `docker restart 0c44b2de07d5`  
  ![docker inspect](image/11.png)  

- Проверим, что контейнер запустился `sudo docker ps`  
  ![docker inspect](image/12.png)  

## Part 2. Операции с контейнером
- Прочитать конфигурационный файл nginx.conf внутри докер контейнера через команду exec   
`sudo docker exec 0c44b2de07d5 cat /etc/nginx/nginx.conf`  
  ![docker](image/13.png)  

- Создадим на локальной машине файл nginx.conf и скопируем в него содержимое конфигурационного файла контейнера:  
  `touch nginx.conf`   
  `docker exec 0c44b2de07d5 cat /etc/nginx/nginx.conf > nginx.conf`  

- Настроим в nginx.conf по пути /status отдачу страницы статуса сервера nginx  
  ![docker inspect](image/14.png)  

- Скопируем созданный файл nginx.conf внутрь докер образа через команду docker cp  и перезапустим nginx внутри докер образа через команду exec  
  `sudo docker cp nginx.conf 0c44b2de07d5:etc/nginx/nginx.conf`   
  `sudo docker exec 0c44b2de07d5 service nginx -s reload`   
  ![docker inspect](image/15.png)  

- Проверим, что по адресу localhost:80/status отдается страничка со статусом сервера nginx   
`open http://localhost:80/status`
  ![docker](image/16.png)  

- Экспортируем контейнер в файл container.tar через команду export и oстановим контейнер   
`sudo docker export 0c44b2de07d5 > container.tar`   
`sudo docker stop 0c44b2de07d5`  
  ![docker](image/17.png)  

- Удалим образ через `sudo docker rmi -f 2a36393edaf1`, не удаляя перед этим контейнеры, добавив флаг -f (--force):
  ![docker inspect](image/18.png)  

- Удалим остановленный контейнер  
`sudo docker rm 0c44b2de07d5`  
  ![docker inspect](image/19.png)  

- Импортируем контейнер обратно через команду import и запустим импортированный контейнер  
`sudo docker import -c 'CMD ["nginx", "-g", "daemon off;"]' container.tar`  
`sudo docker run -d -p 80:80 -p 443:443 1fc89164a0d4`  
  ![docker inspect](image/20.png)  
    - ["nginx", "-g", "daemon off;"] гарантирует, что Nginx останется «на переднем плане», так что Docker сможет правильно отслеживать процесс (в противном случае контейнер остановится сразу после запуска)

- Проверим, что по адресу localhost:80/status отдается страничка со статусом сервера nginx  
`open http://localhost:80/status`  
  ![docker inspect](image/21.png)  

## Part 3. Мини веб-сервер

- Создадим папку server, а в ней файлы server.c и nginx.conf  
  ![server.c](image/22.png)  
  ![nginx.conf](image/23.png)  
  
- Скачаем nginx образ, запустим контейнер с настроенными портами 
  ![docker inspect](image/24.png)  

- Копируем nginx.conf, server.c в докер
  ![docker cp](image/25.png)  

- Проверим наличие скопированных файлов  
  ![docker cat](image/26.png)  

- Заходим в контейнер  
`sudo docker exec -it bc652c873e66 bash`  
и сделаем установку необходимых пакетов: spawn-fcgi, gcc, libfcgi-dev  
`apt-get install -y gcc spawn-fcgi libfcgi-dev`  
 
- Компиляция файла server.c и запуск его через spawn-fcgi  
  ![docker](image/27.png)  

- Перезагрузка контейнера и проверка страницы в браузере  
  ![docker](image/28.png)  
  ![docker](image/29.png)     

- Перекидываем по заданию nginx.conf в папку nginx  
  ![docker](image/30.png)   
 

## Part 4. Свой докер  

- Напишем свой докер образ  
Создаем папку рart4 и в ней файл Dockerfile,а в нем создаем докер-образ:  
  ![docker](image/31.png)  

- В папке рart4 напишем скрипт `run_server.sh`, который будет собирать образ и запускать его на 8080 порту  
  ![docker](image/32.png)  

- Собраем  написанный докер образ через docker build при этом указав имя и тег  
`sudo docker build . -t mydocker:part4`  
  ![docker](image/33.png)  

- Проверим через `sudo docker images`, что все собралось корректно  
  ![docker](image/34.png)  

- С помощью команды docker run запускаем наш собранный докер и делаем маппинг папки nginx `sudo docker run -it --name my_container -p 80:81 -v /home/daariopa/DO5_SimpleDocker-1/src/part4/nginx/nginx.conf -d mydocker:part4 bash` 
  ![docker](image/35.png)  

- С помощью команды `curl http://localhost:80` и `open http://localhost:80` проверяем, что страничка доступна  
  ![docker](image/36.png)  
  ![docker](image/37.png)  

- Допишем в ./nginx/nginx.conf проксирование странички /status, по которой надо отдавать статус сервера nginx  
  ![docker](image/38.png)  

- Перезапустим докер образ `sudo docker restart my_container` и проверим `curl http://localhost:80/status`  и `open http://localhost:80/status`, что отдается страничка со статусом nginx  
  ![docker](image/39.png)  
  ![docker](image/40.png)  

## Part 5. Dockle  

- Установка Dockle по инструкции взятой с  https://github.com/goodwithtech/dockle/blob/master/README.md  
  ![docker](image/41.png)  
- Просканировать образ из предыдущего задания через `dockle [image_id|repository]`   
  ![docker](image/42.png)  
- Исправляем ошибки run_server.sh по инструкции взятой с https://github.com/goodwithtech/dockle/blob/master/CHECKPOINT.md#cis-di-0008:   
  - CIS-DI-0010 - Обнаружен подозрительный ключ ENV.  
  Решение: можем добавить приемлемые ключевые слова при запуске Dockle  
  `--ak NGINX_GPGKEY --ak NGINX_GPGKEY_PATH`    
  - CIS-DI-0001 - Последний пользователь не должен быть root.  
  Решение: в Dockerfile создать пользователя для контейнера   
   `RUN useradd -d /home/daariopa -m -s /bin/bash daariopa`  
   `User daariopa`  
  - CIS-DI-0005 - По умолчанию доверие к содержимому отключено.  
  Решение: включить его перед билдом контейнера  
  `export DOCKER_CONTENT_TRUST=1`  
  - CIS-DI-0006 - Добавьте инструкцию HEALTHCHECK в образы контейнеров Docker, чтобы выполнить проверку работоспособности запущенных контейнеров.  
  Решение: в Dockerfile добавим  
`HEALTHCHECK --interval=5m --timeout=3s \`  
`  CMD curl -f http://localhost/ || exit 1`   
  - CIS-DI-0008 - Подтвердите безопасность файлов setuid и setgid.  
  Решение: в Dockerfile добавим  
  chmod u-s usr/bin/newgrp    
  chmod u-s usr/bin/chsh  
  chmod u-s usr/bin/passwd  
  chmod g-s usr/sbin/unix_chkpwd 
  chmod g-s usr/bin/chage  
  chmod u-s usr/bin/mount 
  chmod g-s usr/bin/expiry  
  chmod u-s usr/bin/gpasswd  
  chmod u-s usr/bin/su  
  chmod u-s usr/bin/chfn  
  chmod u-s usr/bin/umount  
  chmod g-s usr/bin/wall  

  ![docker](image/43.png)  
- Собираем образ  
`sudo docker build . -t mydocker:part4`  
  ![docker](image/44.png)  
- Проверяем с помощью Dockle  
`sudo dockle --ak NGINX_GPGKEY --ak NGINX_GPGKEY_PATH mydocker:part4`  
  ![docker](image/45.png)  
  - При проверки ошибок и предупрежджений не осталось.  
  Рекомендация `export DOCKER_CONTENT_TRUST=1` перед билдом контейнера была проведена, что видно на скрине выше.  

##  Part 6. Базовый Docker Compose

- Установим Docker Compose  
`sudo apt install docker-compose`  
- В папке `рart6/container_part5` создаем все необходимые файлы для контейнера из Part 5:  
  - `nginx\nginx.conf`  
   ![docker](image/46.png)  
  - `Dockerfile`  
   ![docker](image/47.png)   
  - `run_server.sh`  
   ![docker](image/48.png)  
   - `server.c`  
   ![docker](image/49.png)  
- В папке `рart6/nginx_container_part6` создаем все необходимые файлы для контейнерa с nginx, который будет проксировать все запросы с 8080 порта на 81 порт первого контейнера:  
  - `nginx\nginx.conf`  
   ![docker](image/50.png)  
  - `Dockerfile`  
   ![docker](image/51.png)   
  - `run.sh`    
   ![docker](image/52.png)  
- В папке `рart6` создаем файл `docker-compose.yml`  
  ![docker](image/53.png)  
- Остановим все запущенные контейнеры `sudo docker stop [container_id|container_name]`  
  ![docker](image/54.png)  
- Собрать и запустить проект с помощью команд `sudo docker-compose build` и `sudo docker-compose up`  
  ![docker](image/55.png)  
  ![docker](image/56.png)  
- Проверим, что в браузере по `open http://localhost:80` `open http://localhost:80/status` отдается написанная страничка  
  ![docker](image/57.png)  
  ![docker](image/58.png) ![docker](image/59.png)  
  - В терминале появились логи  
    ![docker](image/60.png)  

