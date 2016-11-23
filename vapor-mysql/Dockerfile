FROM vapor

# Install mysql
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN { \
        echo debconf debconf/frontend select Noninteractive; \
        echo mysql-community-server mysql-community-server/data-dir \
            select ''; \
        echo mysql-community-server mysql-community-server/root-pass \
            password ''; \
        echo mysql-community-server mysql-community-server/re-root-pass \
            password ''; \
        echo mysql-community-server mysql-community-server/remove-test-db \
            select false; \
    } | debconf-set-selections && \
    apt-get install -y mysql-server libmysqlclient-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

COPY setup.sh /tmp/setup.sh
COPY setup.sql /tmp/setup.sql
RUN chmod u+x /tmp/setup.sh && \
    /tmp/setup.sh && \
    rm /tmp/setup.*

EXPOSE 3306

ENTRYPOINT service mysql start && bash
