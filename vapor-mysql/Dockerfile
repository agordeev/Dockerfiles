FROM vapor

# Install mysql
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN { \
        echo debconf debconf/frontend select Noninteractive; \
        echo mysql-community-server mysql-community-server/data-dir \
            select ''; \
        echo mysql-community-server mysql-community-server/root-pass \
            password 'default'; \
        echo mysql-community-server mysql-community-server/re-root-pass \
            password 'default'; \
        echo mysql-community-server mysql-community-server/remove-test-db \
            select true; \
    } | debconf-set-selections && \
    apt-get install -y mysql-server libmysqlclient-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

ENTRYPOINT service mysql start && bash

