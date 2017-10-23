FROM ubuntu:16.04

MAINTAINER yanzhenlei@ling.ai

# Install sudo
RUN apt-get update \
    && apt-get -y install sudo \
    && useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

# Install Java8
RUN apt-get install -y software-properties-common curl \
    && add-apt-repository -y ppa:openjdk-r/ppa \
    && apt-get update \
    && apt-get install -y openjdk-8-jdk

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Install utils
RUN apt-get -y install unzip git

# install python
RUN apt-get install -y python

# Gradle opts
ENV GRADLE_USER_HOME /cache
ENV GRADLE_OPTS "-Dorg.gradle.jvmargs=-Xmx4096M"
