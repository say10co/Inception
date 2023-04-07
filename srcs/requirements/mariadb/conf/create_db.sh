# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create_db.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adriouic <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/06 05:38:13 by adriouic          #+#    #+#              #
#    Updated: 2023/04/06 05:38:42 by adriouic         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# if the wordpress-db does not exist, else creat it !
if [ ! -d "/var/lib/mysql/wordpress" ]; then

/usr/bin/mysqld --user=${DB_MYSQL} --bootstrap << EOF 
USE mysql ;
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User='';
DROP DATABASE test;
CREATE DATABASE ${DB_NAME};
CREATE USER '${DB_USER_NAME}'@'%'  IDENTIFIED BY '${DB_USER_PASS}';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '${DB_USER_NAME}'@'%' ;
ALTER USER '${DB_MYSQL}'@'localhost' IDENTIFIED BY '${DB_MYSQL_PASS}';
ALTER USER '${DB_ROOT}'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';
FLUSH PRIVILEGES;
EOF

fi
