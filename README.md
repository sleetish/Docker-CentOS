# Docker-CentOS
Basics for spinning up a container with CentOS 7, systemd and Nginx


# Building and Running


## Create the Base CentOS 7 Image

```
docker build --rm -t c7-base ./centos
```

## Create the Nginx Image

There is a default configuration and HTML page in the `nginx/config` directory.

```
docker build --rm -t c7-nginx ./nginx
```

## Running the Image

```
docker run -ti --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 --name test c7-nginx
```
* Note: Still looking at priviliege mode, but without it we cannot run using systemd

# Manual Docker Engine Install

```
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

```

--------

# Bare VM Testing

## Initial Commands on clean CentOS 7 VM

```
yum install -y git
cd ~/
git clone https://github.com/ChrisCompton/Docker-CentOS.git
cd Docker-CentOS
cd scripts
chmod 755 setup.sh
./setup.sh
```

## For locking down SSH a bit

Make sure to use your own public key! ssh.pub is mine!

```
umask 077 && mkdir -p ~/.ssh
cat ssh.pub >> ~/.ssh/authorized_keys
yum install -y perl
perl -p -i -e 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
perl -p -i -e 's/#PasswordAuthentication no/PasswordAuthentication no/g' /etc/ssh/sshd_config
service sshd restart
```