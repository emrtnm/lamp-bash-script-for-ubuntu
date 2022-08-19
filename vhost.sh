#!/bin/sh
DIVIDER="\n########################################\n\n"

echo "Enter a domain name: \c"
read domainname

sudo mkdir /var/www/$domainname
sudo chown -R $USER:$USER /var/www/$domainname
sudo chmod -R 775 /var/www/$domainname
sudo sed -i 's/your_domain/$domainname/g' domainhost.conf
sudo cat domainhost.conf >> /etc/apache2/sites-available/$domainname.conf
sudo sed -i 's/$domainname/your_domain/g' domainhost.conf
sudo a2ensite $domainname
sudo systemctl reload apache2

printf $DIVIDER
printf "Domain has been added.\n"
printf $DIVIDER