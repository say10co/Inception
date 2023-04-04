FROM alpine:3.16 


RUN apk update && apk upgrade  && apk add --no-cache php8 \
						     php8-session  php8-mysqli

RUN wget -O index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php 

EXPOSE 8080 

CMD ["php8", "-S",  "0.0.0.0:8080", "index.php"]
