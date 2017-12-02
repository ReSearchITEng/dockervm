FROM centos/systemd

MAINTAINER "ResearchITEng" <ResearchITEng@gmail.com>

RUN yum -y install openssh-server iptables docker; yum clean all; systemctl enable sshd docker iptables
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN touch /etc/sysctl.conf  # otherwise sysctl --system fails
#RUN echo '{ "storage-driver": "vfs" }' > /etc/docker/daemon.json # overlay2 is way more performant, but not available in all cases.


EXPOSE 22

## Just like in https://github.com/CentOS/CentOS-Dockerfiles/blob/master/systemd/centos7/Dockerfile
CMD ["/usr/sbin/init"]
