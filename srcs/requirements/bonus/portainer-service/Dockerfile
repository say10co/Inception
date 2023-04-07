FROM alpine:3.17 

RUN apk add --no-cache curl 

RUN curl -L https://github.com/portainer/portainer/releases/download/2.15.1/portainer-2.15.1-linux-amd64.tar.gz > /tmp/portainer-ce.tar.gz && \
	gunzip /tmp/portainer-ce.tar.gz && tar -C /usr/local/ -xvf /tmp/portainer-ce.tar 

WORKDIR /usr/local/portainer/

EXPOSE 9443

CMD ["/usr/local/portainer/portainer"]
