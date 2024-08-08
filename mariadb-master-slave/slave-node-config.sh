# configure node1 mariadb service port
sudo ufw allow 3306

sudo ufw allow 192.168.101.41 to any port 3306

sudo vim /etc/mysql/mariadb.conf.d/50-server.cnf
---
bind-address = 0.0.0.0
server-id =2
---

sudo vim /etc/mysql/my.cnf
---
[mariadb]
bind-address = 0.0.0.0
server-id = 2
log_bin = mysql-bin
---
sudo systemctl restart mariadb.service

sudo mysql_secure_installation