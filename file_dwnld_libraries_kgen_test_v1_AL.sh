#!/bin/bash
# batch_generator_filedwnld_v1.sh
# Download fastqs in batches of 24
# Ellie Fewings, 08Jul2016

# Start message
echo "Started script: $(date +%d%b%Y_%H:%M:%S)"
echo ""

cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/

lib="lib144"

cd "$lib"
samples=$(<${lib}"_samples.txt")
#IFS=$'\n'
#set -f 

#pwd

#echo ${samples}

for sample in ${samples}; do
  #mkdir "$sample"
  echo "Hi"
  echo "$sample"
  #files=$(ls *"$sample"*)
  #mv "$files" "$sample"
  #mv *"$sample"* "$sample"
  #cd "$sample"
  #wget -i "$files"
  #gzip -d *.fastq.gz
  #fq1="$sample""_1.fastq"
  #fq2="$sample""_2.fastq"
  #cat *_1.filt.fastq > "$fq1"
  #cat *_2.filt.fastq > "$fq2"
  #cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/lib144
done


# Completion message
echo ""
echo "Completed script: $(date +%d%b%Y_%H:%M:%S)"
