FROM alpine
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDylenhpZslhZp1MC1RFReK1leDBi7dZjq9RW/JGTDiKHqXZJV1nl6ZF4XRHqWAsw14zstm0t30CvSivU8pSKqqqNMoKGK5MpUZ2gOqsbQ/SeZ9H3zEl5bZlzRAfmhiSJ1WL8X6agxbAdRUInGG2FwLRVjW9zTuye1oF9Z+Sq6ABey4DrCSv55XkhZYT0vLBE+dLliyV9LwoPVf/NhzmsG3sWOJBMBC13uPnT75wY9KLH2KBZ/w4b/+nzt+LhACkuWZnUSoCGoiCwBzmoleAPRwSG6p9XSX00hQbV/GsSgLs8WW+ZKlFCfCn9ptcu+nMxmDM+2uAZtcybOAR9o7d41FgyUeHxsPpa1NLMLNcn4MoXn4JX3OJF2jhq3sUl+zVvQeCywYvCjoGw0NwosMUeAAYL6o5DAZ2U2vGKlL2+18SBZ68TzFYtA87aQdiXAnHuuYTPMRfI+eQoyWMoS4WySkur5/gZ8IIwCBg4Zg4ELCRrR/p2sAYLEukcXQybvMlnB6E9Y+FvXvE2Rv0N/rKTOeG73JPMzQtT7aVDAQIB/IFCkuWeivFpwJtPO8YhAEqy+JlR8KQvZ/rm1Q410D3VnK6t/H8Lg6wRCed39ATcQQ99oRh3TMcMAoH9A9V87uSnthHTq+p6LUlLBt+TJfk1URPptPkQrgmxMNjGGzfbWBiw== flak.yar@gmail.com' > "$HOME"/.ssh/authorized_keys

# Enable password authentication
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config

# Start the SSH server
CMD ["/usr/sbin/sshd", "-D"]

EXPOSE 22

ENTRYPOINT service ssh start && bash
