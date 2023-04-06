# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adriouic <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/06 05:36:36 by adriouic          #+#    #+#              #
#    Updated: 2023/04/06 05:36:46 by adriouic         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17

EXPOSE 443

RUN apk update && apk upgrade && apk add --no-cache nginx

ADD ./tools /etc/nginx/ssl
ADD ./conf /etc/nginx/http.d

USER nginx 

CMD ["nginx", "-g", "daemon off;"]
