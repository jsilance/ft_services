FROM alpine:latest

COPY . /app

EXPOSE 3306

RUN apk update && apk upgrade && apk add mysql mysql-client openrc && rm -f /var/cache/apk/*

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mv /app/srcs/my.cnf /etc/mysql/my.cnf

RUN mkdir -p /run/mysqld

COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

COPY ./srcs/entrypoint.sh /exe/entrypoint.sh

CMD sh /exe/entrypoint.sh
