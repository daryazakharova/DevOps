FROM nginx

RUN apt-get update && \
    apt-get install -y gcc nginx spawn-fcgi libfcgi-dev && \
    rm -rf /var/lib/apt/lists/* 

USER root

WORKDIR /home/

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY server.c /home/server.c
COPY run_server.sh /home/run_server.sh

ENTRYPOINT ["sh", "./run_server.sh"]