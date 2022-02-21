FROM openjdk:18-ea-11-jdk-alpine3.15

EXPOSE 22

# Install docker engine and docker-compose
RUN apk add --update docker docker-compose

# Install essentials
RUN apk add openrc openssh haveged python3 iptables

# VOLUME [ “/sys/fs/cgroup” ]

# Enable and start services
RUN rc-status -a && \
    touch /run/openrc/softlevel && \
    rc-update add docker default && \
    rc-update add sshd default 

# Create jenkins user
RUN addgroup -g 1000 jenkins && \
    adduser -u 1000 -G jenkins -D jenkins
RUN chown -R jenkins:jenkins /home/jenkins

COPY ssh.conf /etc/ssh/sshd_config

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT [ "docker-entrypoint.sh" ]
