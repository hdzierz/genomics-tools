#!/bin/bash

# This program is to set up a docker image for the TEG modified enzymes version of TASSEL5.
# It assumes a Debian 11 base image has been used for the container.

# Upgrade image packages

apt-get update
apt-get -y upgrade

# install curl and openjdk
apt-get -y install \
    openjdk-17-jdk-headless \
    curl

# Move to /opt for installation of the software
cd /opt

# Get the version of TASSEL5 with modified enzymes
wget --no-check-certificate  "https://data.elshiregroup.co.nz/index.php/s/mibW6xktz4GzBqn/download" -P /tmp
mv /tmp/download /tmp/tassel5-TEGenzymes.v.2.tar.gz

curl https://bitbucket.org/tasseladmin/tassel-5-standalone/get/6557864512a89932710b9f53c6005a35ad6c526e.tar.gz --output /tmp/tassel5_standalone.tar.gz

# Unpack TASSEL5
tar -xzf /tmp/tassel5_standalone.tar.gz -C /opt

# Make files readable and executable by all user
chmod -R 755 /opt/tasseladmin-tassel-5-standalone-6557864512a8

# Add TEG Enzymes to enzymes.ini

echo -e "\n[TEGAPEKI]\nname = TEGApeKI\ninitialCutSiteRemnant = CAGC,CTGC\nlikelyReadEnd = GCAGC,GCTGC,GCAGAGAT,GCTGAGAT,GCAGAGTT,GCTGAGTT,GCAGGCCT,GCTGGCCT,GCAGAACCT,GCTGAACCT,GCAGTAGG,GCTGTAGG,GCAGACAGG,GCTGACAGG,GCAGTCAAGG,GCTGTCAAGG,GCAGACGTTC,GCTGACGTTC,GCAGTCTTC, GCTGTCTTC,GCAGATCCGC,GCTGATCCGC,GCAGGTAA,GCTGGTAA,GCAGTTGAA,GCTGTTGAA,GCAGTCTGAA,GCTGTCTGAA\nreadEndCutSiteRemnantLength = 4\n\n[TEGPSTI]\nname = TEGPstI\ninitialCutSiteRemnant = TGCAG\nlikelyReadEnd = CTGCAG,CTGCATGGTT,CTGCAAGTT,CTGCATGCATT,CTGCA2edocraB,CTGCACGTGG,CTGCACTGG,CTGCATGACGG,CTGCATACC,CTGCACCACC,CTGCATGTGCA,CTGCATCGTAA,CTGCATCAA,CTGCATACAA\nreadEndCutSiteRemnantLength = 5\n\n[TEGECOT22I]\nname = TEGEcoT22I\ninitialCutSiteRemnant = TGCAT\nlikelyReadEnd = ATGCAT,ATGCAAGAT,ATGCATGGTT,ATGCAAGTT,ATGCATGCATT,ATGCA2edocraB,ATGCACGTGG,ATGCACTGG,ATGCATGACGG,ATGCATACC,ATGCACCACC,ATGCATGTGCA,ATGCATCGTAA,ATGCATCAA,ATGCATACAA\nreadEndCutSiteRemnantLength = 5" >> /opt/tasseladmin-tassel-5-standalone-6557864512a8/lib/enzymes.ini

# Clean up
apt-get -y remove curl
apt-get clean
