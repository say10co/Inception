#!/bin/sh
# This mihgt be bad, but it works 
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
tee -a  /var/www/wordpress/wp-config.php  << EOF
<?php
define( 'DB_NAME', '${DB_NAME}' );
define( 'DB_USER', '${DB_USER_NAME}' );
define( 'DB_PASSWORD', '${DB_USER_PASS}' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', '6379');
\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
EOF

fi

#sed -i "s/database_name_here/$DB_NAME/g" /var/www/wordpress/wp-config-sample.php
#sed -i "s/username_here/$DB_USER_NAME/g" /var/www/wordpress/wp-config-sample.php
#sed -i "s/password_here/$DB_USER_PASS/g" /var/www/wordpress/wp-config-sample.php
#sed -i "s/localhost/mariadb/g" /var/www/wordpress/wp-config-sample.php
#cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

