FROM alpine:latest

COPY . /app

EXPOSE 3306

VOLUME [ "/var/lib/mysql" ]

RUN apk update && apk upgrade && apk add mysql mysql-client openrc && rm -f /var/cache/apk/*
# RUN apk update && apk upgrade && apk add mariadb openrc && rm -f /var/cache/apk/*

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p /run/mysqld
RUN touch /run/mysqld/mysqld.sock

# RUN mv /app/srcs/my.cnf /etc/mysql/my.cnf
RUN mv /app/srcs/my.cnf /etc/my.cnf

RUN mkdir -p /run/openrc/
RUN touch /run/openrc/softlevel
RUN /etc/init.d/mariadb setup

COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

# COPY ./srcs/entrypoint.sh /exe/entrypoint.sh

CMD sh /app/srcs/entrypoint.sh
