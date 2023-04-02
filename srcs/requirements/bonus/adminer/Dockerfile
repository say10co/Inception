FROM alpine:3.16

RUN apk update && apk upgrade && apk add curl 

WORKDIR /var/www/wordpress 

RUN curl https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php 
