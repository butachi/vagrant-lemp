#!/bin/bash

# config password for root mysql
export MYSQL_ROOT_PASSWORD=123456

# update and cleanup
apt-get update
apt-get dist-upgrade -y
apt-get autoremove -y

# install nginx
apt-get install nginx -y

# install php8.3
mkdir -p /etc/apt/keyrings
apt-get install -y gnupg gosu curl ca-certificates zip unzip git supervisor sqlite3 libcap2-bin libpng-dev python2 dnsutils librsvg2-bin fswatch ffmpeg nano
curl -sS 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x14aa40ec0831756756d7f66c4f4ea0aae5267a6c' | gpg --dearmor | tee /etc/apt/keyrings/ppa_ondrej_php.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/ppa_ondrej_php.gpg] https://ppa.launchpadcontent.net/ondrej/php/ubuntu jammy main" > /etc/apt/sources.list.d/ppa_ondrej_php.list
apt-get update
apt-get install -y php8.3-common php8.3-cli \
        php8.3-dom \
        php8.3-gd \
        php8.3-zip \
        php8.3-curl \
        php8.3-mysql \
        php8.3-sqlite3 php8.3-mbstring \
        php8.3-fpm 

# install mysql
debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD"
apt-get install -y mysql-server

# install composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer


echo "install completed"
