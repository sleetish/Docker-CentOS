# Nginx
FROM c7-base
MAINTAINER "Chris Compton" <chris.compton@va.gov>
RUN yum -y install epel-release
RUN yum -y install nginx
RUN yum clean all

ADD config/apps-enabled /etc/nginx/apps-enabled
ADD config/nginx.conf /etc/nginx/nginx.conf
ADD config/html /var/www/html
RUN find /var/www/html -type d -exec chmod 755 {} ";"
RUN find /var/www/html -type f -exec chmod 644 {} ";"

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]