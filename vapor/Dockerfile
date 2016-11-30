FROM swift3

# Install Vapor Toolbox
RUN curl -sL toolbox.vapor.sh | bash

# Set work dir to /vapor
WORKDIR /vapor

EXPOSE 8080

# If you clone this repository on /Volumes/Sources
# > docker run -ti --name vapor --rm -p 127.0.0.1:8080:8080 -v /Volumes/Sources/Dockerfiles/vapor/projects:/vapor  vapor
