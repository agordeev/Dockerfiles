FROM vapor

# Install sqlite
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils

RUN apt-get install -y sqlite3 libsqlite3-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
