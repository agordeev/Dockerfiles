FROM vapor

# Install postgresql
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils sudo

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql postgresql-client postgresql-contrib && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN service postgresql start && \
    sudo -u postgres psql --command "CREATE USER root WITH SUPERUSER;" 

EXPOSE 5432

ENTRYPOINT service postgresql start && bash
