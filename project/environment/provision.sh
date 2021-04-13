#!/bin/bash

# update and upgrade
sudo apt-get update -y
sudo apt-get upgrade -y

# nginx
sudo apt-get install nginx -y

# npm
sudo apt-get install npm -y

# node js
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
sudo sh -c "echo deb https://deb.nodesource.com/node_6.x xenial main \> /etc/apt/sources.list.d/nodesource.list" 
sudo apt-get update -y
sudo apt-get install nodejs -y

# pm2
sudo npm install -g pm2