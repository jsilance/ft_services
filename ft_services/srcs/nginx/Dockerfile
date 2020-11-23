FROM alpine

COPY . /app

EXPOSE 80 443

RUN apk update

RUN apk add php7 php7-fpm php7-mysqli openssl openrc
RUN apk add nginx

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY ./srcs/index.html /var/www/html/index.html
RUN chmod +x /var/lib/nginx/html/index.html

RUN sh /app/srcs/scripts/gen_certificate.sh

COPY ./srcs/nginx/default.conf /etc/nginx/conf.d/
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

CMD sh /app/srcs/scripts/docker_entrypoint.sh
