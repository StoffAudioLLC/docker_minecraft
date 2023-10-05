FROM ubuntu:latest

ARG JAVAV
ENV JAVAV=$JAVAV

RUN adduser mc

RUN apt-get update -y && apt-get upgrade -y && apt-get install openjdk-$JAVAV-jdk -y && apt-get install curl -y
# Install OpenSSH Server
# Install SSH server
RUN apt-get update && apt-get install -y openssh-server

# Set up configuration for SSH
RUN mkdir /var/run/sshd
RUN echo 'mc:minecraft' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise, the user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Environment variable to ensure SSH doesn't complain about not being run in a terminal
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
COPY ./Minecraft ./Minecraft

ENTRYPOINT [ "/Minecraft/start.sh" ]

CMD [ "/Minecraft/start.sh" ]