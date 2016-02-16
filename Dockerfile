FROM centos/ruby-22-centos7
USER default
EXPOSE 8080

RUN mkdir /opt/app-root/src/

USER root
RUN chmod og+rw /opt/app-root/src/

USER default
CMD echo "This is a test." | wc -