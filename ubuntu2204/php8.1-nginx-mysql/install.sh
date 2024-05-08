#!/bin/bash

# Update package lists
echo "Update Package List"
sudo apt update

# Install Nginx
echo "Install Nginx"
sudo apt install -y nginx

# Install certbot for Let's Encrypt
echo "Install certbot for Let's Encrypt"
sudo apt install -y certbot python3-certbot-nginx

# Install PHP 8.1 and Composer
echo "Install PHP 8.1 and Composer"
sleep 5
echo "Install php8.1"
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt install -y  php8.1-fpm php8.1-mysql php8.1-mbstring php8.1-xml php8.1-zip php8.1-curl php8.1-gd
echo "Install Composer"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"
sleep 5

# Install MySQL Server
echo "Install MYSQL Server"
sudo apt install -y mysql-server

# Start services
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl start php8.1-fpm
sudo systemctl enable php8.1-fpm
sudo systemctl start mysql
sudo systemctl enable mysql
