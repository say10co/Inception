# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adriouic <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/06 05:44:43 by adriouic          #+#    #+#              #
#    Updated: 2023/04/06 05:45:45 by adriouic         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17

ARG REDIS_PASS

RUN apk update && apk upgrade && apk add  --no-cache redis

RUN sed -i "s/^bind 127.0.0.1 -::1$/#bind 127.0.0.1 ::1/g" /etc/redis.conf
RUN sed -i "s/^protected-mode yes$/protected-mode no/g" /etc/redis.conf
RUN sed -i "s/^# requirepass foobared$/requirepass ${REDIS_PASS}/" /etc/redis.conf
RUN sed -i "s|# maxmemory <bytes>|maxmemory 20mb|g"  /etc/redis.conf && \
    echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf

EXPOSE  6379 

#USER redis

CMD ["redis-server", "/etc/redis.conf"] 
