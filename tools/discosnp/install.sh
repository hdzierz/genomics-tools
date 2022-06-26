#!/bin/bash

# This program is to set up a docker image for the discosnp 2.6.2.
# It assumes a Debian 11 base image has been used for the container.

# Update package database and install wget.

apt-get update
apt-get install -y \
    wget \
    gcc \
    g++ \
    make \
    cmake \
    zlib1g-dev \
    libboost-dev \
    git \
    bwa \
    perl \
    python3

# Configure git
git config --global http.sslVerify false

# Clone, compile, and install discosnp
cd /tmp
git clone --recursive https://github.com/GATB/DiscoSnp.git
cd DiscoSnp
sh INSTALL

# Clone, compile, and install short read connector.
git clone --recursive https://github.com/GATB/rconnector.git
cd rconnector
sh INSTALL

# Cleanup

apt-get remove --purge \
    wget \
    gcc \
    g++ \
    make \
    cmake \
    zlib1g-dev \
    libboost-dev \
    git


