#!/bin/bash

yum update -y
amazon-linux-extras enable nginx1
yum install -y nginx

sed -i 's/listen	80;/listen	8080;/g' /etc/nginx/nginx.conf

systemctl start nginx
systemctl enable nginx