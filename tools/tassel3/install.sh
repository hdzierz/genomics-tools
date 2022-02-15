#!/bin/bash

# This program is to set up a docker image for the TEG modified version of TASSEL3.
# It assumes a Debian 9 base image has been used for the container.

# install some things java 6 requires
apt-get -y install ibasound2 libx11-6 libxext6 libxi6 libxt6 libxtst6 wget

# download and install oracle-java6-jdk_6u45_amd64.deb

wget --no-check-certificate "https://data.elshiregroup.co.nz/s/Hsm7Fxz4ZBkoEaf/download/oracle-java6-jdk_6u45_amd64.deb" -P /tmp

# Auotmatically accept java license so this script can run automatically.
echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

# Install java 6
dpkg -i /tmp/oracle-java6-jdk_6u45_amd64.deb

# Move to /opt for installation of the software
cd /opt

# Get the version of TASSEL3 with modified enzymes
wget --no-check-certificate  "https://data.elshiregroup.co.nz/s/9yZZKE4LQQpyM3W/download/tassel3.0.174-TEGenzymes.v2.tar.gz" -P /tmp

# Unpack TASSEL3
tar -xzf /tmp/tassel3.0.174-TEGenzymes.v2.tar.gz -C /opt

# Make files readable and executable by all user
chmod -R 755 /opt/tassel3-src
