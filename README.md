# Docker-CentOS
Basics for spinning up a container with CentOS 7, systemd and Nginx

## Initial Commands from a clean CentOS 7 VM

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