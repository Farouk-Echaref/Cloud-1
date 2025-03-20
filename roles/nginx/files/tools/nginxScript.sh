#!/bin/sh

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/OU=student/CN=fech-cha.42.ma"

addgroup -g 82 -S www-data 
adduser -u 82 -D -S -G www-data www-data

chown -R www-data:www-data /var/www/html
chmod -R 0777 /var/www/html

nginx -g "daemon off;"