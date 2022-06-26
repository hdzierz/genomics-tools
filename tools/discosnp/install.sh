#!/bin/bash

# This program is to set up a docker image for the discosnp 2.6.2.
# It assumes a Debian 11 base image has been used for the container.

# Update package database and install wget.

apt-get update
apt-get install -y wget

# Install mini-conda
cd /tmp
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh

bash Miniconda3-py39_4.12.0-Linux-x86_64.sh -b -p /opt/conda

# Remove wget
apt-get remove -y wget
apt-get autoremove -y

# Install discosnp via conda

/opt/conda/condabin/conda install -c bioconda -y discosnp

# Add /opt/conda/bin to path

sed --in-place 's/PATH=\"/PATH=\"\/opt\/conda\/bin:/g' /etc/login.defs
