FROM alpine:3.16

#adding arguments 
ARG PHP_VERSION=8\
	DB_NAME \
	DB_USER_NAME\
	DB_USER_PASS 

RUN apk update && apk upgrade && apk add --no-cache wget unzip \
	 php${PHP_VERSION} 	 \
	php${PHP_VERSION}-fpm    \
	php${PHP_VERSION}-json	 \
	php${PHP_VERSION}-mysqli \
	&& sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g'  /etc/php8/php-fpm.d/www.conf ;

WORKDIR /var/www

COPY ./requirements/wordpress/conf/wp-config-create.sh .

RUN wget https://wordpress.org/latest.zip	&& \
			unzip latest.zip	&& \
			sh wp-config-create.sh && rm -rf wp-config-create.sh  latest.zip

CMD ["/usr/sbin/php-fpm8", "-F"]
