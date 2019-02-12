#!/bin/bash

#update centos with any patches
yum update -y --exclude=kernel

#Tools
yum install -y nano git unzip screen

#Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

#Share folder between host and guest
rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

#PHP
yum install -y php php-cli php-common php-devel php-mysql

#MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";

#Download starter Content
cd /vagrant
sudo -u vagrant wget --header="Authorization: token a964e1997ed4f535606ba46c16c02e0395ccdcc2" -q 'https://raw.githubusercontent.com/jorael12345/labPerf/master/files/index.html'
sudo -u vagrant wget --header="Authorization: token a964e1997ed4f535606ba46c16c02e0395ccdcc2" -q 'https://raw.githubusercontent.com/jorael12345/labPerf/master/files/info.php'

service httpd restart
