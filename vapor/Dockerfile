FROM swift31

# Install Vapor Toolbox
RUN cd /tmp && \
    git clone https://github.com/vapor/toolbox.git && \
    cd toolbox && \
    git checkout 1.0.9 && \
    swift build -c release && \
    mv .build/release/Executable /usr/local/bin/vapor && \
    cd /tmp && \
    rm -rf toolbox 

# Set work dir to /vapor
WORKDIR /vapor

EXPOSE 8080

# If you clone this repository on /Volumes/Sources
# > docker run -ti --name vapor --rm -p 127.0.0.1:8080:8080 -v /Volumes/Sources/Dockerfiles/vapor/projects:/vapor  vapor
