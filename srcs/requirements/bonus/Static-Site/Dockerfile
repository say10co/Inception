FROM alpine:3.17

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache  nginx \
	&& rm -rf /etc/nginx/http.d/default.conf

ADD ./conf /etc/nginx/http.d

USER nginx

EXPOSE 80

# Note the ';' 
CMD ["nginx", "-g", "daemon off;"]
