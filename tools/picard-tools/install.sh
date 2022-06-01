#!/bin/bash

# This program is to set up a docker image for the Picard tools version 2.24.1.
# It assumes a Debian 11 base image has been used for the container.

# Update the version of Debian; hopefully this includes the latest version of Java!
apt-get -y update

# Install picard tools from apt. Assume that this will remain version 2.24.1.
apt install -y picard-tools
