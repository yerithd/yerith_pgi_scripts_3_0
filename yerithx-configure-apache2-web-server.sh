#!/bin/bash

current_pwd=$(pwd)

cd /etc/apache2/mods-enabled;

ln -s ../mods-available/userdir.load userdir.load
ln -s ../mods-available/userdir.conf userdir.conf

ln -s ../mods-available/socache_shmcb.load socache_shmcb.load

ln -s ../mods-available/socache_memcache.load socache_memcache.load

ln -s ../mods-available/ssl.load ssl.load
ln -s ../mods-available/ssl.conf ssl.conf

sudo /etc/init.d/mysql stop

sudo /etc/init.d/mysql start

cd ${current_pwd}
