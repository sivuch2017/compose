FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

# Repository
RUN sed -i -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list

# Base
RUN apt-get update && \
    apt-get install -y locales && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Doxygen
RUN apt-get update && \
    apt-get install -y doxygen graphviz && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

WORKDIR /src
VOLUME ["/src"]
