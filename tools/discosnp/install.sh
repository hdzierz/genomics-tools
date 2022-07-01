#!/bin/bash

# This program is to set up a docker image for the discosnp 2.6.2.
# It assumes a Debian 11 base image has been used for the container.

# Update package database and install wget and dos2unix

apt-get update
apt-get install -y \
    wget \
    dos2unix

# Install mini-conda
cd /tmp
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh

bash Miniconda3-py39_4.12.0-Linux-x86_64.sh -b -p /opt/conda

# Install discosnp via conda

/opt/conda/condabin/conda install -c bioconda -y discosnp

# The source has issues that need correcting for this to work in a docker container. 
# These include blank first lines, inconsistent #! lines, \r\n characters, and 
# missing executable flags. The next section fixes those issues.

# Remove empty first lines:
# discoSnpRAD/post-processing_scripts
#    ./add_cluster_info_to_mapped_vcf.py
#    ./filter_by_cluster_size_and_rank.py

cd /opt/conda/discoSnpRAD/post-processing_scripts

# Find all files with blank first line and remove it.
find ./ -type f -regex '.*\.py' -exec sed -i -e '1{/^[[:blank:]]*$/d;}' '{}' \;

# Make files Executable

chmod +x /opt/conda/scripts/remove_extensions_disco_file.py

chmod +x /opt/conda/discoSnpRAD/post-processing_scripts/add_cluster_info_to_mapped_vcf.py
chmod +x /opt/conda/discoSnpRAD/post-processing_scripts/filter_vcf_by_indiv_cov_max_missing_and_maf.py
chmod +x /opt/conda/discoSnpRAD/post-processing_scripts/vcf2structure.sh
    
chmod +x /opt/conda/scripts/validation_scripts/compare_vcf_disco_pos_allele_only.py
chmod +x /opt/conda/scripts/validation_scripts/eval_disco_one_snp_per_locus.py

chmod +x /opt/conda/scripts/simulations/multiple_samples_simulator.sh
chmod +x /opt/conda/scripts/simulations/random_mut_fasta.py
chmod +x /opt/conda/scripts/simulations/targeted_mut_fasta_corrected.py

# Add env in path for python scripts
# sed -i '1c\#!/usr/bin/env python3' file 


sed -i '1c\#!/usr/bin/env python3' /opt/conda/scripts/functionObjectVCF_creator.py
sed -i '1c\#!/usr/bin/env python3' /opt/conda/scripts/keep_extensions_disco_file.py
sed -i '1c\#!/usr/bin/env python3' /opt/conda/scripts/redundancy_removal_discosnp.py
sed -i '1c\#!/usr/bin/env python3' /opt/conda/scripts/VCF_creator.py
sed -i '1c\#!/usr/bin/env python3' /opt/conda/scripts/remove_extensions_disco_file.py

sed -i '1c\#!/usr/bin/env python3' /opt/conda/scripts/discoSnpRAD/post-processing_scripts/1SNP_per_cluster.py
sed -i '1c\#!/usr/bin/env python3' /opt/conda/scripts/discoSnpRAD/post-processing_scripts/add_cluster_info_to_mapped_vcf.py
sed -i '1c\#!/usr/bin/env python3' /opt/conda/scripts/discoSnpRAD/post-processing_scripts/filter_by_cluster_size_and_rank.py
sed -i '1c\#!/usr/bin/env python3' /opt/conda/scripts/discoSnpRAD/post-processing_scripts/filter_paralogs.py
sed -i '1c\#!/usr/bin/env python3' /opt/conda/scripts/discoSnpRAD/post-processing_scripts/filter_vcf_by_indiv_cov_max_missing_and_maf.py
    
# Change \r\n line endings to \n only (dos2unix)

dos2unix /opt/conda/discoSnpRAD/clustering_scripts/fasta_and_cluster_to_filtered_vcf.py
    
dos2unix /opt/conda/discoSnpRAD/post-processing_scripts/filter_vcf_by_indiv_cov_max_missing_and_maf.py

# Collect Garbage
apt-get remove -y wget dos2unix
apt-get autoremove -y
