#!/bin/bash

# This program is to set up a docker image for the ipyrad version 0.9.83
# It assumes a Debian 11 base image has been used for the container.

# Update package database and install curl

apt-get update
apt-get install -y curl 

# Install mini-conda
cd /tmp
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh

bash Miniconda3-py39_4.12.0-Linux-x86_64.sh -b -p /opt/conda

# Remove curl
apt-get remove -y curl

# Install ipyrad

/opt/conda/condabin/conda install ipyrad -c conda-forge -c bioconda
