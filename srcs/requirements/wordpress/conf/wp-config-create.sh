#!bin/sh
# This mihgt be bad, but it works 
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
	sed -i "s/database_name_here/$DB_NAME/g" /var/www/wordpress/wp-config-sample.php
	sed -i "s/username_here/$DB_USER_NAME/g" /var/www/wordpress/wp-config-sample.php
	sed -i "s/password_here/$DB_USER_PASS/g" /var/www/wordpress/wp-config-sample.php
	sed -i "s/localhost/mariadb/g" /var/www/wordpress/wp-config-sample.php
	cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
fi
