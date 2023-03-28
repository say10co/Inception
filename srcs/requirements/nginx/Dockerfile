#specifying which image we want to deploy
FROM alpine:3.17

# this doea not open the port 443
# it documets for the image reader that it's using the port 
# if the option -P is used then docker will publish all expoed ports
EXPOSE 443

# not that apK is used instrad of apt 
# this is  lightweight file manager for alpine
# remember the 53.2 MB :)

# creatign system user and add it to www-data group
#RUN chown -R nginx:www-datat /var/www && chmod 750 /var/www 

# installing nginx
# this is equivalant to apt install nginx
RUN apk update && apk upgrade && apk add --no-cache nginx

# For debugging pupresses 
# nginx is been run on forground
# using exec form 

USER nginx 

CMD ["nginx", "-g", "daemon off;"]
