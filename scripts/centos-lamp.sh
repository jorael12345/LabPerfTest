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
sudo -u vagrant wget -q https://raw.githubusercontent.com/jorael12345/labPerf/master/files/index.html?token=ApnU9W7T8H4-TdUNgiimxp0ZFbtwxvqnks5ca71CwA%3D%3D
sudo -u vagrant wget -q https://raw.githubusercontent.com/jorael12345/labPerf/master/files/info.php?token=ApnU9aOdlSs1-IkfPM4EBqHTosIOiSbkks5ca73BwA%3D%3D
service httpd restart
