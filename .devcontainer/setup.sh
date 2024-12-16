#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get install -y \
    clang \
    clangd \
    autoconf \
    automake \
    bison \
    curl \
    flex \
    g++ \
    libx11-dev \
    libtool \
    make