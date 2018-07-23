#!/bin/bash
# Sets permissions of the owncloud instance for updating

ocpath='/var/www/html'    #change for the path to you owncloud instance 
htuser='apache'           #change for the account name configured to run apache on your server
htgroup='apache'          #change for the apache group (this is often the same thing as the username)

chown -R ${htuser}:${htgroup} ${ocpath}
