###### Node1 Server Config

# mysql database server config
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf

bind-address 0.0.0.0
server-id 1

# restart mysql service
sudo systemctl restart mysql.service

# allow port 3306
sudo ufw allow 3306
sudo ufw allow from 192.168.101.10 to any port 3306

###### Node2 Server Config

# mysql database server config
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf

bind-address 0.0.0.0
server-id 1

# restart mysql service
sudo systemctl restart mysql.service

# allow port 3306
sudo ufw allow 3306
sudo ufw allow from 192.168.101.10 to any port 3306