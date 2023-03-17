#!/bin/bash

# This program is to set up a docker image for the bcftools 1.11.
# It assumes a Debian 1 base image has been used for the container.

# Update image
apt-get update
apt-get -y upgrade

# install bcftools
apt-get -y install bcftools

# Clean up - Remove any packages / files needed only to build the image (e.g. build-essential) and clean the apt cache files.
apt-get clean
