# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adriouic <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/06 05:50:07 by adriouic          #+#    #+#              #
#    Updated: 2023/04/06 05:51:15 by adriouic         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17

# Note default.conf might be accessed by nginx
RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache  nginx \
	&& rm -rf /etc/nginx/http.d/default.conf

ADD ./conf /etc/nginx/http.d
ADD ./data /var/www/html

USER nginx

EXPOSE 80

# Note the ';' 
CMD ["nginx", "-g", "daemon off;"]
