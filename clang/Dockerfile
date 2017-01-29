FROM ubuntu:16.04

COPY install /tmp/install
RUN chmod u+x /tmp/install && \
    /tmp/install --package=clang --package=libicu-dev --package=curl --package=ca-certificates --package=git --package=vim --package=tree

ENV PATH /usr/bin:$PATH

