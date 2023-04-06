# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adriouic <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/06 05:45:56 by adriouic          #+#    #+#              #
#    Updated: 2023/04/06 05:48:19 by adriouic         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.16

ARG FTP_USER \
    FTP_PASS \
    FTP_GROUP \
    FTP_HOME_DIR

RUN mkdir -p ${FTP_HOME_DIR} \
	&& addgroup ${FTP_GROUP} \ 
	&& adduser -D -s /bin/sh -h ${FTP_HOME_DIR} ${FTP_USER} -G ${FTP_GROUP} 

RUN echo "${FTP_USER}:${FTP_PASS}" | /usr/sbin/chpasswd

RUN apk update \
	&& apk add --no-cache vsftpd\
	&& sed -i 's/^LISTEN=YES$/#LISTEN=YES/'  /etc/vsftpd/vsftpd.conf \
	&& sed -i "s/^anonymous_enable=YES$/anonymous_enable=NO/" /etc/vsftpd/vsftpd.conf \
	&& sed -i "s/^#local_enable=YES$/local_enable=YES/" /etc/vsftpd/vsftpd.conf \
	&& sed -i "s/^#write_enable=YES$/write_enable=YES/" /etc/vsftpd/vsftpd.conf \
	&& sed -i "s/^#chroot_local_user=YES$/chroot_local_user=YES/" /etc/vsftpd/vsftpd.conf \
	&& echo "local_root=${FTP_HOME_DIR}" >> /etc/vsftpd/vsftpd.conf \
	&& echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf \
	&& echo "pasv_enable=YES" >> /etc/vsftpd/vsftpd.conf \
	&& echo "pasv_min_port=30000" >> /etc/vsftpd/vsftpd.conf \
	&& echo "pasv_max_port=30010" >> /etc/vsftpd/vsftpd.conf  \
	&& echo 'seccomp_sandbox=NO' >> /etc/vsftpd/vsftpd.conf 

EXPOSE 21 20

#Multy purpose  -- security check needed  !! 
#USER ftpuser

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
