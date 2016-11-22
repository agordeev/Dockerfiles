FROM clang

RUN ["/bin/bash", "-c","\
    export SWIFT=3.0.1 && \
    export UBUNTU=16.04 && \
    export SWIFT_ARCHIVE_NAME=swift-${SWIFT}-RELEASE-ubuntu${UBUNTU} &&  \
    export SWIFT_URL=https://swift.org/builds/swift-${SWIFT}-release/ubuntu${UBUNTU//.}/swift-${SWIFT}-RELEASE/${SWIFT_ARCHIVE_NAME}.tar.gz && \
    cd /tmp && \
    mkdir swift.org && \
    cd swift.org && \
    curl -OL ${SWIFT_URL} &&  \
    curl -OL ${SWIFT_URL}.sig &&  \
    tar -xvzf ${SWIFT_ARCHIVE_NAME}.tar.gz --directory / --strip-components=1 &&  \
    rm -rf $SWIFT_ARCHIVE_NAME* /tmp/* /var/tmp/*"]

ENV PATH /usr/bin:$PATH

RUN swift --version
