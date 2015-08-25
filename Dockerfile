##########################################################
# Dockerfile to build container image of Jenkins
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER RajithaK (rajithak@brandix.com)

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp

# Install Java & Other essential tools
RUN apt-get install -y wget &&\
    wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add - &&\
    sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list' &&\
    apt-get update &&\
    apt-get install -y jenkins &&\
    apt-get install -y elinks &&\
    apt-get install -y nano     

EXPOSE 8080 80

RUN mv /etc/bash.bashrc /etc/bash.bashrc.backup
ADD bash.bashrc /etc/