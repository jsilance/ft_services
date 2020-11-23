FROM alpine

COPY . /app

EXPOSE 5050

RUN apk update && apk upgrade && apk add bash
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN apk add openssl openrc
RUN apk add nginx

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY ./srcs/wordpress /var/www/localhost/htdocs

RUN chmod +x /var/www/localhost/htdocs/*

COPY ./srcs/nginx/nginx.conf /etc/nginx/
COPY ./srcs/nginx/default.conf /etc/nginx/conf.d/

COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

ENTRYPOINT sh /app/srcs/scripts/docker_entrypoint.sh
