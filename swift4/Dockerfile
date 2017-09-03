FROM ubuntu:16.10

COPY install /tmp/install
RUN chmod u+x /tmp/install 
RUN /tmp/install --update=true
RUN /tmp/install --package=libicu-dev --package=curl --package=libpython2.7 --package=libxml2 --package=libcurl3 --package=ca-certificates 
RUN /tmp/install --package=clang --package=git --package=vim --package=tree
RUN /tmp/install --source=apple --ubuntu=16.10 --swift=4.0 --branch=yesterday
RUN /tmp/install --clean=true

ENV PATH /usr/bin:$PATH

# Set work dir to /projects
WORKDIR /projects
