FROM ubuntu:16.04

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y clang libicu-dev curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PATH /usr/bin:$PATH

