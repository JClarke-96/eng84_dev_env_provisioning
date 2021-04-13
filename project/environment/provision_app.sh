#!/bin/bash

# update and upgrade
sudo apt-get update -y
sudo apt-get upgrade -y

# nginx
sudo apt-get install nginx -y

# npm
sudo apt-get install npm -y

# node js
sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y

# pm2
sudo npm install -g pm2