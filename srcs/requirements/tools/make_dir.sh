#!/usr/bin/sh

create="--CREATE"
delete="--DELETE"

if [ "$1"  = "$create" ] && [ ! -d /home/${USER}/data ];then
	mkdir -p ~/data/mariadb
	mkdir ~/data/wordpress
	mkdir ~/data/Portainer-data

elif  [ "$1" = "$delete" ]; then

	rm -rf ~/data/wordpress/* && \
		printf "Deleting Wordpress files (~/data/wordpress) [OK]\n"
	rm -rf ~/data/maridb/* && \
		printf "Deleting Database files (~/data/mariadb) [OK]\n"
fi
