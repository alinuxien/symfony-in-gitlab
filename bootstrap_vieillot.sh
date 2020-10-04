#!/usr/bin/env bash

unset UCF_FORCE_CONFFOLD
export UCF_FORCE_CONFFNEW=YES
ucf --purge /boot/grub/menu.lst

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" upgrade
apt-get install curl wget unzip -y
# Install requirements for Symfony
apt-get install -y php php-bcmath php-cli php-curl php-zip php-sqlite3 php-mysql php-xml php-mbstring
wget https://getcomposer.org/composer.phar
mv composer.phar /usr/bin/composer
chmod +x /usr/bin/composer
wget https://get.symfony.com/cli/installer -O - | bash
mv /root/.symfony/bin/symfony /usr/local/bin/symfony

