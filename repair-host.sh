#!/bin/sh
DIVIDER="\n########################################\n\n"

echo "Chmod For Folders: 755"
echo "Chmod For Files: 644"
echo "Enter a domain name: \c"
read domainname

if [ -d  "/var/www/${domainname}" ]
then
  sudo chown -R www-data:www-data /var/www/${domainname}
  sudo find /var/www/${domainname} -type d -print0 | xargs -0 chmod 755
  sudo find /var/www/${domainname} -type f -print0 | xargs -0 chmod 644
else
  echo "Domain not found."
fi

printf $DIVIDER
printf "Domain has been repaired.\n"
printf $DIVIDER
