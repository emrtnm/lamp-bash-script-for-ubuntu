#!/bin/sh
DIVIDER="\n***************************************\n\n"

# Remove php, php packages and other apps.
sudo apt-get remove wget screen unzip curl -y
sudo apt-get purge php-* -y
sudo apt-get purge php* -y

# Remove mysql and mariadb
sudo service stop mysql
sudo apt-get remove mysql-server mysql-client mysql-common -y
sudo apt-get purge mysql-* -y
sudo apt-get purge mysql* -y
sudo rm -rf /usr/bin/mysql
sudo rm -rf /usr/lib/mysql
sudo rm -rf /usr/share/mysql
sudo rm -rf /usr/share/man/man1/mysql.*
sudo rm -rf /etc/mysql

# Remove apache2
sudo service apache2 stop
sudo apt-get purge apache2 apache2-utils apache2.2-bin apache2-common -y
sudo apt-get remove --purge apache2 apache2-utils apach2.2-bin apache2-common -y
sudo rm -rf /var/www

# Remove phpmyadmin
sudo rm -rf /usr/share/phpmyadmin

# Auto remove
sudo apt-get autoremove -y
sudo apt-get autoclean -y
sudo rm -rf /tmp/*

# Msg
printf $DIVIDER
printf "Components removed.\n"
printf $DIVIDER
