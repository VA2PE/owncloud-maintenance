#!/bin/bash

ocpath='/var/www/html/'         #Change for the path of your owncloud install
ocdata='/var/www/html/data'     #Change for the path of your owncloud data folder
htuser='apache'                 #Change for the account name configured to run apache on your server
htgroup='apache'                #Change for the apache group (this is often the same thing as the username)
rootuser='root'

printf "Creating possible missing Directories\n"
mkdir -p $ocdata
mkdir -p $ocpath/updater

printf "chmod Files and Directories\n"
find ${ocpath}/ -type f -print0 | xargs -0 chmod 0640
find ${ocpath}/ -type d -print0 | xargs -0 chmod 0750
find ${ocdata}/ -type f -print0 | xargs -0 chmod 0640
find ${ocdata}/ -type d -print0 | xargs -0 chmod 0750

printf "chown Directories\n"
chown -R ${rootuser}:${htgroup} ${ocpath}/
chown -R ${htuser}:${htgroup} ${ocpath}/apps/
chown -R ${htuser}:${htgroup} ${ocpath}/config/
chown -R ${htuser}:${htgroup} ${ocdata}/
chown -R ${htuser}:${htgroup} ${ocpath}/updater/

chmod +x ${ocpath}/occ

printf "chmod/chown .htaccess\n"
if [ -f ${ocpath}/.htaccess ]
 then
  chmod 0644 ${ocpath}/.htaccess
  chown ${rootuser}:${htgroup} ${ocpath}/.htaccess
fi
if [ -f ${ocdata}/.htaccess ]
 then
  chmod 0644 ${ocdata}/.htaccess
  chown ${rootuser}:${htgroup} ${ocdata}/.htaccess
fi
