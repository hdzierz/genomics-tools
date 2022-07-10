#!/bin/bash

# This program is to set up a docker image for GBS-PreProcess 1.0.0.
# It assumes a Debian 11 base image has been used for the container.

# Install dependencies.

apt-get update
apt-get install -y \
    wget \
    trim-galore \
    perl

cpan -i   Getopt::Long \
    threads \
    threads::shared \
    Thread::Semaphore \
    IO::CaptureOutput
    
# install gbs-preprocess
cd /opt
mkdir gbs-preprocess
cd gbs-preprocess
wget https://github.com/relshire/GBS-PreProcess/blob/master/batch_trim.pl
wget https://github.com/relshire/GBS-PreProcess/blob/master/batch_trim_se.pl
wget https://github.com/relshire/GBS-PreProcess/blob/master/verify_chimeras.pl
chmod +x /opt/gbs-preprocess/*

# Collect the garbage

apt-get remove --purge -y wget
