#!/bin/bash
echo "This is for testing second time" >> /etc/config
yum -y install nginx 
echo "Hello Playground" >> /var/www/html/index.html
service nginx restart
