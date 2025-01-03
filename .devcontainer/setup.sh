#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get install -y \
    git \
    clang \
    clangd \
    autoconf \
    automake \
    bison \
    flex \
    g++ \
    libx11-dev \
    libxaw7-dev \
    libtool \
    libreadline-dev \
    make \
    cmake




