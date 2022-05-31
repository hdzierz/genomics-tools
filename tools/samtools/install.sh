#!/bin/bash

# This program is to set up a docker image for samtools version 1.11.
# It assumes a Debian 11 base image has been used for the container.

# install samtools
apt install -y samtools
