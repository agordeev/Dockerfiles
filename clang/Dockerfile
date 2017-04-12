FROM ubuntu:16.10

COPY install /tmp/install
RUN chmod u+x /tmp/install && \
    /tmp/install --package=clang --package=libicu-dev --package=curl --package=ca-certificates --package=git --package=vim --package=tree --package=libpython2.7

ENV PATH /usr/bin:$PATH

