######### Server Config

# change root password
sudo passwd root

# enable firewall access
sudo ufw enable

# enable openssh access
sudo ufw allow openssh

# package update
sudo apt-get update

# install vim/unzip/net-tools
sudo apt-get install vim unzip net-tools

# allow root access for remote
sudo vim /etc/ssh/sshd_config

PermitRootLogin yes

# restart ssh service
sudo systemctl restart ssh.service

######### Database Installation 

# install mysql server & client
sudo apt-get install mysql-server mysql-client

# start and enable mysql service
sudo systemctl start mysql.service
sudo systemctl enable mysql.service

######### Static IP Config

# config static ip netplan
sudo vim /etc/netplan/50-cloud-init.yaml

dhcp : false
addresses : 
 - 192.168.101.10/24

# netplan try/apply & restart networkd service
sudo netplan try
sudo netplan apply
sudo systemctl restart systemd-networkd

# check ip address
ifconfig

inet 192.168.101.10

# restart database node1 and switch vm network as host-network.