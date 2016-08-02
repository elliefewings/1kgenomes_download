#!/bin/bash
# batch_generator_filedwnld_v1.sh
# Download fastqs in batches of 24
# Ellie Fewings, 08Jul2016

# Start message
echo "Started script: $(date +%d%b%Y_%H:%M:%S)"
echo ""

cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/lib2
IFS=$'\n'

download_file="lib2_1kgenomes_part2.txt"
rename_file="lib2_filerename.txt"

wget -i ${download_file}

while read oldname newname ; do
  mv ${oldname} ${newname}
  rm ${oldname}
done < ${rename_file}

# Completion message
echo ""
echo "Completed script: $(date +%d%b%Y_%H:%M:%S)"
