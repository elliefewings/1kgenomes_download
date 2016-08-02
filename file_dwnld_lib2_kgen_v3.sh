#!/bin/bash
# batch_generator_filedwnld_v1.sh
# Download fastqs in batches of 24
# Ellie Fewings, 02Aug2016

# Start message
echo "Started script: $(date +%d%b%Y_%H:%M:%S)"
echo ""

cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/lib2

download_file="lib2_1kgenomes_eur_extended_fem_onefile_v4_todownload.txt"
wget -nc -i ${download_file}

rename_file="lib2_filerename.txt"
while read oldname newname ; do
  mv ${oldname} ${newname}
done < ${rename_file}

rm *filt*

# Completion message
echo ""
echo "Completed script: $(date +%d%b%Y_%H:%M:%S)"
