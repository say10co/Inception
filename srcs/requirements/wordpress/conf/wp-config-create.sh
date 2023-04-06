# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wp-config-create.sh                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adriouic <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/06 05:42:29 by adriouic          #+#    #+#              #
#    Updated: 2023/04/06 05:43:44 by adriouic         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# This mihgt be bad, but it works 
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then

# Append (-a) these changes to wp-config 
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
define( 'WP_REDIS_PASSWORD', '${REDIS_PASS}' );
\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
EOF

fi
