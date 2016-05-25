# Nginx
FROM c7-base
MAINTAINER "Chris Compton" <chris.compton@va.gov>
RUN yum -y install epel-release
RUN yum -y install nginx
RUN yum clean all
RUN systemctl enable nginx.service
EXPOSE 80 443
CMD ["/usr/sbin/init"]
