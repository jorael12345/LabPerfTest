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
sudo -u vagrant wget -q https://raw.githubusercontent.com/jorael12345/labPerf/master/files/index.html?token=Ac5b8816a4c6023c262ecafdeac384e2d56fdb366
sudo -u vagrant wget -q https://raw.githubusercontent.com/jorael12345/labPerf/master/files/info.php?token=c5b8816a4c6023c262ecafdeac384e2d56fdb366
service httpd restart
