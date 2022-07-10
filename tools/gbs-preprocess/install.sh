#!/bin/bash

# This program is to set up a docker image for GBS-PreProcess 1.0.0.
# It assumes a Debian 11 base image has been used for the container.

# Install dependencies.

apt-get update
apt-get install -y \
    git \
    trim-galore \
    perl

cpan -i   Getopt::Long \
    threads \
    threads::shared \
    Thread::Semaphore \
    IO::CaptureOutput
    
# install gbs-preprocess
cd /opt

git clone https://github.com/relshire/GBS-PreProcess.git

mv GBS-PreProcess gbs-preprocess

# Collect the garbage

apt-get remove --purge -y \
    git
    
apt-get autoremove --purge -y

apt-get clean
