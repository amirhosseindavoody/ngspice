#!/bin/sh

apk add --no-cache --virtual .build-deps \
    clang \
    clangd \
    autoconf \
    automake \
    bison \
    curl \
    flex \
    g++ \
    libx11-dev \
    libxaw-dev \
    libtool \
    make