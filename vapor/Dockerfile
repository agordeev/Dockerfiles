FROM ubuntu:16.10

COPY install /tmp/install
RUN chmod u+x /tmp/install 
RUN /tmp/install --update=true
RUN /tmp/install --source=apt --apt=vapor
RUN /tmp/install --source=apt --swift=3.1.1 
RUN /tmp/install --source=apt --vapor=2.0.4 
RUN /tmp/install --package=git --package=vim --package=tree
RUN /tmp/install --clean=true

# Set work dir to /vapor
WORKDIR /vapor

EXPOSE 8080

# Launch the image with this command: 
# docker run -ti --rm --name vapor -p 127.0.0.1:8080:8080 -v $(pwd)/vapor/projects:/vapor vapor
