FROM centos:latest
MAINTAINER The Contos project
RUN yum -y install httpd
EXPOSE 80
CMD /usr/sbin/httpd -D FOREGROUND
