# Nginx
FROM c7-base
MAINTAINER "Chris Compton" <chris.compton@va.gov>
RUN yum -y install epel-release
RUN yum -y install nginx
RUN yum clean all

ADD config/apps-enabled /etc/nginx/apps-enabled
ADD config/nginx.conf /etc/nginx/nginx.conf
ADD config/html /var/www/html

RUN systemctl enable nginx.service
EXPOSE 80 443
CMD ["/usr/sbin/init"]