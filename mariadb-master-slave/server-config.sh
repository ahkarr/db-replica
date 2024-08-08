# config on both two database nodes
# change root password
sudo passwd root

# change root user
sudo su - root

# firewall enable
sudo ufw enable

# firewall allow openssh
sudo ufw allow openssh

# update package
sudo apt-get update

# install mariadb and package
sudo apt-get install curl wget unzip vim net-tools mariadb-server

# start and enable mariadb service
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service

# config ssh for root remote access
sudo vim /etc/ssh/sshd_config

PermitRootLogin yes

# restart ssh service
sudo systemctl restart ssh.service

# config Static-IP Address
sudo vim /etc/netplan/00-installer-config.yml

  dhcp: false
  addresses:
    - 192.168.101.40/24

# config and restart network services
sudo netplan try
sudo netplan apply
sudo systemc restart systemd-networkd