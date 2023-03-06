FROM alpine:3.17

# pulling mariadb-server and mariadb-client
RUN apk update && apk add --no-cache mariadb mariadb-client

#setting socket folder for mariadb
RUN mkdir /var/run/mysqld ; chmod 777 /var/run/mysqld

#installing mariadb in /var/lib/mysql
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql 


EXPOSE 3306

# running as mysqld user is great 
USER mysql

#start mysql deamon
CMD ["/usr/bin/mysqld", "--skip-log-error"]
