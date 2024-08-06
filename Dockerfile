FROM alpine
RUN apk add --update --no-cache openssh
RUN mkdir /var/run/sshd
RUN mkdir -p root/.ssh
ADD id_rsa.pub root/.ssh/authorized_keys

# Enable password authentication
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config

RUN ssh-keygen -f /root/.ssh/id_rsa -P ""

EXPOSE 22

# Start the SSH server
CMD ["/usr/sbin/sshd", "-D", "-h", "/root/.ssh/id_rsa"]
