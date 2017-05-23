FROM ubuntu:16.10

COPY install /tmp/install
RUN chmod u+x /tmp/install 
RUN /tmp/install --source=apt --apt=vapor
RUN /tmp/install --source=apt --swift=3.1.1 
RUN /tmp/install --package=git --package=vim --package=tree
RUN /tmp/install --clean=true

ENV PATH /usr/bin:$PATH
