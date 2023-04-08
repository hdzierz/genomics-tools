#!/bin/bash

# This program is to set up a docker image for atropos 1.1.29+dfsg-1
# It assumes a Debian 11 base image has been used for the container.

# Update image
apt-get update
apt-get -y upgrade

# install atropos and suggested
apt-get -y install \
    atropos \
    tqdm \
    python3-jinja2 \
    khmer \
    python3-pysam
    
# Clean up - Remove any packages / files needed only to build the image (e.g. build-essential) and clean the apt cache files.
apt-get clean
