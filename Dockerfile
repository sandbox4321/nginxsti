FROM nginx:latest
USER root

RUN apt-get install vim -y
RUN mkdir -p /opt/nginx /opt/nginx/conf.d /opt/nginx/log /opt/nginx/run /opt/nginx/cache
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.disabled.conf
COPY ./nginx/nginx.conf /opt/nginx/nginx.conf
COPY ./nginx/conf.d/nginx.app.conf /opt/nginx/conf.d/app.conf

# Copy webapp static files
COPY dist/ /opt/app-root

EXPOSE 8080 
RUN chmod -R og+rw /opt/app-root/ && \
	chmod -R og+rw /opt/nginx

USER 1001

CMD ["nginx","-p","/opt/nginx/", "-c", "nginx.conf", "-g", "daemon off;"]
