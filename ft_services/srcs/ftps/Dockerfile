FROM alpine

EXPOSE 21 21000 21001 21002 21003 21004

RUN apk update && apk upgrade

RUN apk add openssl pure-ftpd telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN adduser -D -h /home/jsilance jsilance
RUN echo "jsilance:jsilance" | chpasswd
RUN echo -e 'jsilance\njsilance' | pure-pw useradd jsilance -u jsilance -g jsilance -d /home/jsilance

RUN echo "TLS 1" >> /etc/pure-ftpd.conf
RUN echo "TLSCipherSuite HIGH" >> /etc/pure-ftpd.conf
RUN echo "CertFile /etc/ssl/private/pure-ftpd.pem" >> /etc/pure-ftpd.conf

RUN openssl req -x509 -nodes -days 365 -subj "/C=BE/ST=BX/L=Belgique/O=19/CN=jsilance" -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem
RUN chmod 600 /etc/ssl/private/pure-ftpd.pem

COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./srcs/entrypoint.sh /exe/entrypoint.sh

CMD sh /exe/entrypoint.sh