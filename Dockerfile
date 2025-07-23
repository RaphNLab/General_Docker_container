####################################################################
# Development
####################################################################
FROM sas-base AS sas-development

ENV UDEV=1

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
    git \
    python3


# USER $SAS_USERNAME

# create a directory for the project
RUN \
    mkdir -p /work/ && \
    cd /work && \
    git clone https://github.com/libopencm3/libopencm3 && \
    cd /work/libopencm3 && \
    make TARGETS=stm32/l1


# Clone project
RUN \
    git clone https://github.com/RaphNLab/RE46C109_Programmer ./smoke_programmer && \
    cd ./smoke_programmer && \
    git checkout develop && \
    cmake -B build -DCMAKE_TOOLCHAIN_FILE=cmake/arm-gcc-toolchain.cmake



