#!/bin/bash

# This program is to set up a docker image for the SolexaQA++ version 3.1.7.3
# It assumes a Debian 11 base image has been used for the container.

# Update image
apt-get update
apt-get -y upgrade

# Install dependencies for graphics for reports and curl to download SolexaQA++
apt-get -y install \
    r-cran-gridbase \
    curl \
    unzip

    
# install SolexaQA++
curl https://versaweb.dl.sourceforge.net/project/solexaqa/src/SolexaQA%2B%2B_v3.1.7.3.zip -o /tmp/SolexaQA%2B%2B_v3.1.7.3.zip
cd /tmp
unzip SolexaQA%2B%2B_v3.1.7.3.zip
mv /tmp/SolexaQA\+\+_v3.1.7.3/Linux_x64/SolexaQA\+\+ /opt/

# Clean up - Remove any packages / files needed only to build the image (e.g. build-essential) and clean the apt cache files.
apt-get clean
