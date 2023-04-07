# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adriouic <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/06 05:38:55 by adriouic          #+#    #+#              #
#    Updated: 2023/04/06 05:40:20 by adriouic         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17

# build time env
ARG	DB_NAME       \ 	
	DB_USER_PASS  \   
	DB_USER_NAME  \   
	DB_ROOT	      \   
	DB_ROOT_PASS  \   
	DB_MYSQL      \   
	DB_MYSQL_PASS 

RUN apk update && apk add --no-cache mariadb mariadb-client

#setting socket folder for mariadb
RUN mkdir /var/run/mysqld nslookup; chmod 777 /var/run/mysqld

RUN mysql_install_db --user=$DB_MYSQL --datadir=/var/lib/mysql 

EXPOSE 3306

COPY requirements/mariadb/conf/create_db.sh . 
#ADD ../tools/mariadb-dump.sql /var/lib/mysql

# create  databse 
RUN sh create_db.sh && rm -rf create_db.sh

# Run mysqld as mysql user  
USER mysql

# start mysqld deamon
CMD ["/usr/bin/mysqld", "--skip-log-error", "--bind-address=0.0.0.0", "--skip-networking=0"]

