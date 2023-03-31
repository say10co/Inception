FROM alpine:3.16

ARG FTP_USER \
    FTP_PASS \
    FTP_GROUP \
    FTP_HOME_DIR

RUN mkdir -p ${FTP_HOME_DIR} && addgroup ${FTP_GROUP} \ 
	&& adduser -D -s /bin/sh -h ${FTP_HOME_DIR} ${FTP_USER} -G ${FTP_GROUP} 

RUN echo "${FTP_USER}:${FTP_PASS}" | /usr/sbin/chpasswd

RUN apk update \
	&& apk add --no-cache vsftpd \
	&& echo 'seccomp_sandbox=NO' >> /etc/vsftpd/vsftpd.conf \
	&& sed -i "s/^#local_enable=YES/local_enable=YES$/" /etc/vsftpd/vsftpd.conf \
	&& sed -i "s/^anonymous_enable=YES$/anonymous_enable=NO/" /etc/vsftpd/vsftpd.conf 

EXPOSE 21

WORKDIR /var/www/wordpress

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
