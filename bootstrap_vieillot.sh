#!/usr/bin/env bash
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" upgrade
apt-get install curl wget unzip -y
# Install requirements for Symfony
apt-get install -y php php-bcmath php-cli php-curl php-zip php-sqlite3 php-mysql php-xml php-mbstring
wget https://getcomposer.org/composer.phar
mv composer.phar /usr/bin/composer
chmod +x /usr/bin/composer

