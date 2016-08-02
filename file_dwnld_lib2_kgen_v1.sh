#!/bin/bash
# batch_generator_filedwnld_v1.sh
# Download fastqs in batches of 24
# Ellie Fewings, 08Jul2016

# Start message
echo "Started script: $(date +%d%b%Y_%H:%M:%S)"
echo ""

cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/lib2

download_file="lib2_1kgenomes_eur_extended_fem_onefile_v4_todownload.txt"
rename_file="lib2_filerename.txt"

#wget -nc -i ${download_file}

while read oldname newname ; do
  echo ${oldname}
  #echo ${newname}
  #mv ${oldname} ${newname}
  
 # rm ${oldname}
done < ${rename_file}

# Completion message
echo ""
echo "Completed script: $(date +%d%b%Y_%H:%M:%S)"
