#!/bin/bash
sudo su -
yes | yum update &&  yum upgrade
yes | yum install httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.servic

echo "hello from apache server"  > /var/www/html/index.html