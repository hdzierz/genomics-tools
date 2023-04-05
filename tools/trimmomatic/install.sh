#!/bin/bash

# This program is to set up a docker image for trimmomatic 0.39.
# It assumes a Debian 11 base image has been used for the container.

# Update image
apt-get update
apt-get -y upgrade

# install trimmomatic and dependencies
apt-get -y install trimmomatic

# Clean up - Remove any packages / files needed only to build the image (e.g. build-essential) and clean the apt cache files.
apt-get clean
