FROM ubuntu:16.04

MAINTAINER yanzhenlei@ling.ai

# Install sudo
RUN apt-get update \
    && apt-get -y install sudo \
    && useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

ENV HOME /root

# config LC_ALL
ENV LC_ALL en_US.UTF-8

RUN apt-get update \ 
    && apt-get install -y language-pack-en \
    && locale-gen en_US.UTF-8 \
    && dpkg-reconfigure locales

RUN mkdir /server
WORKDIR /server
