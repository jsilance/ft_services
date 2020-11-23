FROM alpine:latest

EXPOSE 3000

RUN apk update
RUN apk upgrade
RUN apk add grafana telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN wget -O /tmp/grafana.tar.gz https://dl.grafana.com/oss/release/grafana-6.7.3.linux-amd64.tar.gz
RUN tar -zxvf /tmp/grafana.tar.gz -C /
RUN mv /grafana-6.7.3 /grafana

COPY ./srcs/automatic.yml /grafana/conf/provisioning/datasources/automatic.yml

COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

COPY ./srcs/dashboards/dashboards.yaml /grafana/conf/provisioning/dashboards/dashboards.yaml

COPY ./srcs/dashboards /grafana/conf/provisioning/dashboards

COPY ./srcs/entrypoint.sh /exe/entrypoint.sh

CMD sh /exe/entrypoint.sh