telegraf&
influx -execute "create user admin with password 'admin'"
influxd -config /etc/influxdb.conf
influxd