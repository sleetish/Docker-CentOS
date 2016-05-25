# Nginx
# docker build --rm -t c7-nginx
# docker run -ti --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 --name test c7-base

FROM c7-base
MAINTAINER "Chris Compton" <chris.compton@va.gov>
RUN yum -y install epel-release
RUN yum -y install nginx
RUN yum clean all
RUN systemctl enable nginx.service
EXPOSE 80 443
CMD ["/usr/sbin/init"]



#docker exec test yum -y install epel-release
#docker exec test yum -y install nginx
#docker exec test yum clean all
#docker exec test systemctl enable nginx.service
#docker exec test systemctl start nginx.service
#docker exec test ps -ef
