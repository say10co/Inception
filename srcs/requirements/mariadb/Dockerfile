
FROM alpine:3.17

# pulling mariadb-server and mariadb-client
RUN apk update && apk add --no-cache mariadb mariadb-client

#setting socket folder for mariadb
RUN mkdir /var/run/mysqld nslookup; chmod 777 /var/run/mysqld

#installing mariadb in /var/lib/mysql
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql 

EXPOSE 3306

COPY requirements/mariadb/conf/create_db.sh . 

# build time env
ARG	DB_NAME       \ 	
	DB_USER_PASS  \   
	DB_USER_NAME  \   
	DB_ROOT	      \   
	DB_ROOT_PASS  \   
	DB_MYSQL      \   
	DB_MYSQL_PASS 

#creating the databse 
RUN sh create_db.sh && rm -rf create_db.sh

# running as mysqld user is great 
USER mysql

#start mysql deamon
CMD ["/usr/bin/mysqld", "--skip-log-error", "--bind-address=0.0.0.0", "--skip-networking=0"]

