#!/bin/sh

YERITH_ROOT_DIR_CURRENT_SCRIPT="$(pwd)"

YERITH_APACHE_DIR="/etc/apache2"

sudo ./yerithx-setup-local-files-config-for-DEBIAN.sh

sudo cp php/adminer-4-7-3.php /var/www/html/adminer.php

sudo cp my.vimrc /etc/vim/vimrc
sudo cp my.xsessionrc ~/.xsessionrc

cd "${YERITH_APACHE_DIR}"
cd mods-enabled

sudo ln -s ../mods-available/ssl.conf ssl.conf
sudo ln -s ../mods-available/ssl.load ssl.load

sudo ln -s ../mods-available/userdir.conf userdir.conf
sudo ln -s ../mods-available/userdir.load userdir.load

sudo ln -s ../mods-available/socache_memcache.load socache_memcache.load

sudo ln -s ../mods-available/socache_shmcb.load socache_shmcb.load

cd "${YERITH_ROOT_DIR_CURRENT_SCRIPT}"
