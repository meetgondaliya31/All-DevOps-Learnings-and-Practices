#!/bin/bash

sudo apt-get update
sudo apt-get install nginx -y

echo "<h1>this nginx is started using terraform</h1>" > /var/www/html/index.html