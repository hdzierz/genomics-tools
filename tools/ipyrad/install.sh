#!/bin/bash

# This program is to set up a docker image for the ipyrad version 0.9.83
# It assumes a Debian 11 base image has been used for the container.

# Update package database and install curl, python2.7 & gpg

apt-get update
apt-get install -y curl python2.7 gpg

# Install mini-conda
# Install our public GPG key to trusted store
curl https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc | gpg --dearmor > conda.gpg
install -o root -g root -m 644 conda.gpg /usr/share/keyrings/conda-archive-keyring.gpg

# Check whether fingerprint is correct (will output an error message otherwise)
gpg --keyring /usr/share/keyrings/conda-archive-keyring.gpg --no-default-keyring --fingerprint 34161F5BF5EB1D4BFBBB8F0A8AEB4F8B29D82806

# Add our Debian repo
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/conda-archive-keyring.gpg] https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main" > /etc/apt/sources.list.d/conda.list

# Install it!
apt-get update
apt-get install -y conda

# Remove curl

apt-get remove -y curl

# Install ipyrad

/opt/conda/condabin/conda install ipyrad -c conda-forge -c bioconda
