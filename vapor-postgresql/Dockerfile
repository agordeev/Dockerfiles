FROM vapor

# Install postgresql
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils sudo

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql postgresql-client postgresql-contrib libpq-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY setup.sh /tmp/setup.sh
COPY setup.sql /tmp/setup.sql
RUN chmod u+x /tmp/setup.sh && \
    /tmp/setup.sh && \
    rm /tmp/setup.* 

EXPOSE 5432

ENTRYPOINT service postgresql start && bash

# Launch the image with this command (replace '/Volumes/Sources' by your path)
#  docker run -ti --name vapor-postgresql --rm -p 127.0.0.1:8080:8080 -p 127.0.0.1:5432:5432 -v progresql.data:/var/lib/postgresql/9.5/main -v /Volumes/Sources/Dockerfiles/vapor-mpostgresql/projects:/vapor vapor-postgresql
