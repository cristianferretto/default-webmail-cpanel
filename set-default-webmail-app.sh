#!/bin/bash

DOMAIN=$1
APP=$2

if [ -z "$DOMAIN" ]; then
	echo "Set the domain name."
	exit 1
fi

if [ -z "$APP" ]; then
	echo "Set default app."
	exit 1
fi

DIR_MAIL="./mail/${DOMAIN}/"

if [ -e "$DIR_MAIL" ]; then
	for EMAIL in $(ls ${DIR_MAIL});
	do
		printf "%s" ${APP} > ./.cpanel/nvdata/${EMAIL}@${DOMAIN}_default_webmail_app;
		echo "Application '$APP' defined as '$EMAIL@$DOMAIN' successfully."
	done

else
	echo "This domain name dont exist."
	exit 1
fi

FILE_CACHE="./.cpanel/nvdata.cache"

if [ -e "$FILE_CACHE" ]; then
	rm ${FILE_CACHE}
	echo "Clean Cache!"
fi
