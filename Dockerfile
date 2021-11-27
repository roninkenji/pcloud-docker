FROM debian:buster-slim

WORKDIR /usr/src
RUN apt update && apt install -y cmake zlib1g-dev libboost-system-dev libboost-program-options-dev libpthread-stubs0-dev libfuse-dev libudev-dev fuse build-essential git
RUN git clone https://github.com/pcloudcom/console-client.git .
RUN cd /usr/src/pCloudCC/lib/pclsync && \
    make clean && \
    make fs && \
    cd ../mbedtls/ && \
    cmake . && \
    make clean && \
    make && \
    cd ../.. && \
    cmake . && \ 
    make && \
    make install && \
    ldconfig
