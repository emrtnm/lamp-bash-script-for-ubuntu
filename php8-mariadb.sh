#!/bin/sh
DIVIDER="\n########################################\n\n"

printf "Requirements are installing...\n"

sudo add-apt-repository ppa:ondrej/php -y
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
sudo > /etc/apache2/apache2.conf
sudo cat ./apache2.conf >> /etc/apache2/apache2.conf
sudo echo "<?php phpinfo();" >> /var/www/html/index.php

printf $DIVIDER
printf "PHP8.1 is installing..."
printf $DIVIDER

sudo apt-get install php8.1 -y
sudo apt-get install php8.1-cli php8.1-gd php8.1-mysql php8.1-imap php8.1-curl php8.1-intl php8.1-pspell php8.1-sqlite3 php8.1-tidy php8.1-xmlrpc php8.1-xsl php8.1-zip php8.1-mbstring php8.1-soap php8.1-opcache php8.1-common php8.1-readline php8.1-xml -y

printf $DIVIDER
printf "PHP8.1 has been installed.\n"
printf $DIVIDER

printf $DIVIDER
printf "Mariadb is installing...\n"
printf $DIVIDER

sudo apt-get install mariadb-server -y

mysql_secure_installation

printf $DIVIDER
printf "Mariadb has been installed.\n"
printf $DIVIDER

sudo systemctl start mariadb
sudo systemctl start apache2

