FROM nginx

RUN apt-get update && \
    apt-get install -y gcc nginx spawn-fcgi libfcgi-dev && \
    rm -rf /var/lib/apt/lists/* && \
    chmod u-s usr/bin/newgrp && \
    chmod u-s usr/bin/chsh && \
    chmod u-s usr/bin/passwd && \
    chmod g-s usr/sbin/unix_chkpwd && \
    chmod g-s usr/bin/chage && \
    chmod u-s usr/bin/mount && \
    chmod g-s usr/bin/expiry && \
    chmod u-s usr/bin/gpasswd && \
    chmod u-s usr/bin/su && \
    chmod u-s usr/bin/chfn && \
    chmod u-s usr/bin/umount && \
    chmod g-s usr/bin/wall
   
WORKDIR /home/

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY server.c /home/server.c
COPY ./run_server.sh /home/run_server.sh

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

ENTRYPOINT ["sh", "./run_server.sh"]