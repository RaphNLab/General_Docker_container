####################################################################
# Development
####################################################################
FROM sas-base AS sas-development

ARG GIT_FULL_NAME=${GIT_FULL_NAME}
ARG GIT_EMAIL=${GIT_EMAIL}
ENV GIT_FULL_NAME=$GIT_FULL_NAME
ENV GIT_EMAIL=$GIT_EMAIL

USER root
RUN \
    apt update &&  apt install -y \
    cmake \
    gcc-arm-none-eabi \
    libnewlib-arm-none-eabi \
    build-essential \
    binutils-arm-none-eabi \
    openocd \
    gdb-multiarch \
    make \
    libusb-1.0-0-dev \
    git \
    python3

# create a directory for the project
RUN \
    mkdir -p /work/ && \
    cd /work && \
    git clone https://github.com/libopencm3/libopencm3 && \
    cd /work/libopencm3 && \
    make

USER $SAS_USERNAME
RUN git config --global user.name $GIT_FULL_NAME &&\
    git config --global user.email $GIT_EMAIL