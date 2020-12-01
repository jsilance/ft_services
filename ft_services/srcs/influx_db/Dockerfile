FROM alpine:latest

EXPOSE 8086

# VOLUME [ "/var/lib/influxdb" ]

RUN apk update && apk upgrade && apk add influxdb

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY ./srcs/influxdb.conf /etc/influxdb.conf

COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

COPY ./srcs/entrypoint.sh /exe/entrypoint.sh

CMD sh /exe/entrypoint.sh
