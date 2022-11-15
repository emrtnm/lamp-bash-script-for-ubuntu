#!/bin/sh
DIVIDER="\n########################################\n\n"

echo "Enter a domain name: \c"
read domainname

sudo mkdir /var/www/${domainname}
sudo chown -R www-data:www-data /var/www/${domainname}
sudo find /var/www/${domainname} -type d -print0 | xargs -0 chmod 755
sudo find /var/www/${domainname} -type f -print0 | xargs -0 chmod 644

sudo sed -i "s|your_domain|${domainname}|g" domainhost.conf
sudo cat domainhost.conf >> /etc/apache2/sites-available/$domainname.conf
sudo sed -i "s|${domainname}|your_domain|g" domainhost.conf
sudo a2ensite $domainname
sudo systemctl reload apache2

printf $DIVIDER
printf "Domain has been added.\n"
printf $DIVIDER
