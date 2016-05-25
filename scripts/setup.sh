#yum install -y git
#cd ~/
#git clone https://github.com/ChrisCompton/Docker-CentOS.git
#cd Docker-CentOS

#umask 077 && mkdir -p ~/.ssh
#cat ssh.pub >> ~/.ssh/authorized_keys
#yum install -y perl
#perl -p -i -e 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
#perl -p -i -e 's/#PasswordAuthentication no/PasswordAuthentication no/g' /etc/ssh/sshd_config
#service sshd restart

yum update -y
sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

yum update -y
yum install -y docker-engine
service docker start

docker build --rm -t c7-base ../centos
#docker run -ti --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 --name test c7-base

docker build --rm -t c7-nginx ../nginx
docker run -ti --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 --name test c7-nginx
