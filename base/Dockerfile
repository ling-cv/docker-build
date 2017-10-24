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

# Install Java8
RUN apt-get install -y software-properties-common curl \
    && add-apt-repository -y ppa:openjdk-r/ppa \
    && apt-get update \
    && apt-get install -y openjdk-8-jdk

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Install utils
RUN apt-get -y install build-essential software-properties-common unzip git wget curl man cmake

# Install g++
RUN apt-get -y install g++

# install python
RUN apt-get install -y python python-dev python-pip

# install vim
RUN apt-get install -y vim \
    && git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime \
    && sh ~/.vim_runtime/install_awesome_vimrc.sh

# install zsh
RUN apt-get install -y zsh \
    && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && chsh -s /bin/zsh

RUN mkdir /workspace    
WORKDIR /workspace
CMD ["zsh"]
