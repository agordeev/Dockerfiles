FROM clang

COPY install /tmp/install
RUN chmod u+x /tmp/install && \
    /tmp/install --ubuntu=16.10 --package=libxml2 --package=libcurl3 --swift=3.1 

ENV PATH /usr/bin:$PATH
