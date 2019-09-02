#!/bin/bash

# This program is to set up a docker container for the tool dDocent version 2.7.8.
# It depends on a standard Debian 9 docker image.

apt-get install -y wget freebayes stacks trimmomatic mawk bwa samtools vcftools bio-rainbow seqtk cd-hit bedtools libvcflib1 libvcflib-tools gnuplot parallel bamtools java git

# Download and install dDocent
cd /tmp
git clone https://github.com/relshire/dDocent.git
mv ./dDocent /opt/

#sudo chown debian:debian /opt/dDocent

echo '# The following puts the dDocent installation in the user path.' >> ~/.bashrc
echo 'export PATH="/opt/dDocent/bin:$PATH"' >> ~/.bashrc
