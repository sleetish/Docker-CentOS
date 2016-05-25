# CentOS
# docker build --rm -t c7-base .
# docker run -ti --stop-signal=RTMIN+3 -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 --security-opt seccomp:unconfined --rm --name test c7-base
# docker run -ti --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 --name test c7-base

FROM centos:7
MAINTAINER "Chris Compton" <chris.compton@va.gov>
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done);
RUN rm -f /lib/systemd/system/multi-user.target.wants/*;
RUN rm -f /etc/systemd/system/*.wants/*;
RUN rm -f /lib/systemd/system/local-fs.target.wants/*;
RUN rm -f /lib/systemd/system/sockets.target.wants/*udev*;
RUN rm -f /lib/systemd/system/sockets.target.wants/*initctl*;
RUN rm -f /lib/systemd/system/basic.target.wants/*;
RUN rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
#VOLUME [ "/tmp", "/run" ]
CMD ["/usr/sbin/init"]
#RUN sudo systemctl show-environment