#!/bin/bash
   sudo su -
   #export TEST_VARIABLE=${lb_dns }  
   yes | apt-get update &&  apt-get upgrade 
   yes | apt-get install nginx 
   systemctl start nginx
   sysstemctl enable nginx
   touch /etc/nginx/sites-available/test.conf
  echo "
  server {

   server_name localhost;

      location / {

        proxy_connect_timeout 3s;
        proxy_read_timeout 10s;

        proxy_pass "${lb_dns}" ;
      }
    }

  " >   /etc/nginx/sites-available/test.conf
  ln -s /etc/nginx/sites-available/test.conf /etc/nginx/sites-enabled