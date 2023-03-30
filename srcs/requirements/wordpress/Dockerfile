FROM alpine:3.16

#adding arguments 
ARG	PHP_VERSION=8\
	DB_NAME \
	DB_USER_NAME\
	DB_USER_PASS \
	REDIS_PASS

RUN	apk update && apk upgrade && apk add --no-cache wget unzip \
	php${PHP_VERSION} 	 \
	php${PHP_VERSION}-fpm    \
	php${PHP_VERSION}-json	 \
	php${PHP_VERSION}-mysqli \
	php${PHP_VERSION}-dom \
	php${PHP_VERSION}-exif \
	php${PHP_VERSION}-fileinfo \
	php${PHP_VERSION}-mbstring \
	php${PHP_VERSION}-zip \
	php${PHP_VERSION}-gd \
	php${PHP_VERSION}-iconv \
	php${PHP_VERSION}-intl  \
	php${PHP_VERSION}-curl \
	php${PHP_VERSION}-redis \
	php${PHP_VERSION}-ctype \
	&& sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g'  /etc/php8/php-fpm.d/www.conf \
	&& sed -i 's/nobody/www-data/g'  /etc/php8/php-fpm.d/www.conf ;


RUN 	set -x && \
	adduser -u 82 -D -G www-data www-data && \
	chown -R www-data:www-data /var/log/php8 && \
	chmod -R 777 /var/log/php8

WORKDIR /var/www

COPY 	./requirements/wordpress/conf/wp-config-create.sh .

RUN	wget https://wordpress.org/latest.zip \
	&& unzip latest.zip \
	&& chown -R www-data:www-data ./wordpress/ && chmod 777 ./wordpress/ \
	&& sh wp-config-create.sh && rm -rf wp-config-create.sh  latest.zip 
			
USER www-data

CMD ["/usr/sbin/php-fpm8", "-F"]
