FROM ppc64le/ubuntu:16.04
MAINTAINER Victor Lee "lisy@zoomserver.cn"

RUN apt-get update && apt-get install -y openssh-server \
    && apt-get clean && rm -fr /var/lib/apt/lists/*

RUN mkdir /var/run/sshd && echo 'root:root' |chpasswd \
    && sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
