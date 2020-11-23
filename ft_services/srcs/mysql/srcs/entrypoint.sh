telegraf&
openrc&
rc-service mysqld stop
rm -R /var/lib/mysql/*
mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql
rc-service mysqld start

touch /run/openrc/softlevel

/usr/bin/mysqld --user=root --bootstrap < /app/srcs/wp_db.sql

/usr/bin/mysqld --user=root &

sleep 10
/usr/bin/mysql wordpressdata < /app/srcs/wordpress.sql

tail -F /dev/null
