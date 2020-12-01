telegraf&
openrc&

mysql_install_db --user=root > /dev/null
/usr/bin/mysqld --user=root --bootstrap --verbose=0 < /app/srcs/wp_db.sql

/usr/bin/mysqld --user=root --console

tail -F /dev/null
