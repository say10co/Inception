FROM alpine:3.17

RUN apk update && apk upgrade && apk add  --no-cache redis

RUN sed -i "s/^bind 127.0.0.1 -::1$/#bind 127.0.0.1 ::1/g" /etc/redis.conf
RUN sed -i "s/^protected-mode yes$/protected-mode no/g" /etc/redis.conf
RUN sed -i "s|# maxmemory <bytes>|maxmemory 20mb|g"  /etc/redis.conf && \
    echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf

EXPOSE  6379 

#USER redis

CMD ["redis-server", "/etc/redis.conf"] 