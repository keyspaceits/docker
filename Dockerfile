FROM rockylinux:9
LABEL maintainer="your-email@example.com"
RUN yum -y install httpd
COPY index.html /var/www/html
EXPOSE 80
CMD ["httpd", "-D", "FOREGROUND"]
