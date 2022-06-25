#!/bin/bash

# This program is to set up a docker image for the discosnp 2.6.2.
# It assumes a Debian 11 base image has been used for the container.

# Update package database and install wget and bwa (for mapping).

apt-get update
apt-get install -y wget \
                   bwa \
                   tree

# Install mini-conda
cd /tmp
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh

bash Miniconda3-py39_4.12.0-Linux-x86_64.sh -b -p /opt/conda

# Remove wget
apt-get remove -y wget

# Install discosnp via conda

/opt/conda/condabin/conda install -c bioconda discosnp

# let's see what is in the installed subdirectory

tree -R /opt/conda/condabin/conda/
