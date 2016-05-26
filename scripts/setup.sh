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
docker build --rm -t c7-nginx ../nginx
docker run -d -p 80:80 --name test c7-nginx
# docker run -ti --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 --name test c7-nginx