#!/bin/sh
DIVIDER="\n########################################\n\n"

echo "Enter a domain name: \c"
read domainname

if [ -d  "/var/www/${domainname}" ]
then
  sudo a2dissite $domainname
  sudo rm -rf /etc/apache2/sites-available/$domainname.conf
  sudo rm -rf /var/www/$domainname
  sudo systemctl reload apache2
else
  echo "Domain not found."
fi

printf $DIVIDER
printf "Domain has been removed.\n"
printf $DIVIDER
