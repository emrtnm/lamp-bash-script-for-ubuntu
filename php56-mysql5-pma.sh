#!/bin/sh
DIVIDER="\n########################################\n\n"

printf "Requirements are installing...\n"

sudo add-apt-repository ppa:ondrej/php
sudo apt install software-properties-common apt-transport-https -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install wget nano screen unzip curl apache2 -y
sudo ufw allow in "Apache"
sudo ufw allow in "Apache Full"

sudo mkdir /var/www
sudo mkdir /var/www/html
sudo chown -R $USER:$USER /var/www
sudo chmod -R 775 /var/www
sudo rm -rf /var/www/html/index.html
sudo echo "<?php phpinfo();" >> /var/www/html/index.php

printf $DIVIDER
printf "PHP5.6 is installing..."
printf $DIVIDER

sudo apt-get install php5.6 php5.6-gd php5.6-mysql php5.6-imap php5.6-curl php5.6-intl php5.6-pspell php5.6-recode php5.6-sqlite3 php5.6-tidy php5.6-xmlrpc php5.6-xsl php5.6-zip php5.6-mbstring php5.6-soap php5.6-opcache php5.6-json php5.6-readline php5.6-xml -y

printf $DIVIDER
printf "PHP5.6 has been installed.\n"
printf $DIVIDER

printf $DIVIDER
printf "Mysql is installing...\n"
printf $DIVIDER

sudo wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.12-1_all.deb
sudo apt-get update
sudo apt-get install mysql-client=5.7.30-1ubuntu18.04 -y
sudo apt-get install mysql-community-server=5.7.30-1ubuntu18.04 -y
sudo apt-get install mysql-server=5.7.30-1ubuntu18.04 -y

sudo systemctl restart mysql.service

printf $DIVIDER
printf "Mysql has been installed.\n"
printf $DIVIDER

printf $DIVIDER
printf "Phpmyadmin is installing...\n"
printf $DIVIDER

sudo wget https://files.phpmyadmin.net/phpMyAdmin/4.9.10/phpMyAdmin-4.9.10-all-languages.zip -O phpmyadmin.zip
sudo unzip phpmyadmin.zip
sudo rm phpmyadmin.zip
sudo mv phpMyAdmin-4.9.10-all-languages/ /usr/share/phpmyadmin
sudo chown -R $USER:$USER /usr/share/phpmyadmin
sudo chmod -R 755 /usr/share/phpmyadmin
sudo cat ./phpmyadmin.conf >> /etc/apache2/conf-available/phpmyadmin.conf
sudo mkdir /usr/share/phpmyadmin/tmp/
sudo chown -R www-data:www-data /usr/share/phpmyadmin/tmp/
sudo a2enconf phpmyadmin
sudo systemctl reload apache2

printf $DIVIDER
printf "Phpmyadmin has been installed.\n"
printf $DIVIDER
