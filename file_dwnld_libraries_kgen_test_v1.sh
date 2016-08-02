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
samples_file=$(cat *"samples.txt")
IFS=$'\n'
set -f 

pwd
for sample in ${samples_file}; do
  mkdir "$sample"
  echo "$sample"
  files="lib144_""${sample}""_1kgenomes_eur_extended_fem_onefile_v4_todownload.txt"
  echo ${files} 
  cp ${files} ${sample}
  cd "$sample"
  wget -i "$files"
  gzip -d *.fastq.gz
  fq1="$sample""_1.fastq"
  fq2="$sample""_2.fastq"
  cat *_1.filt.fastq > "$fq1"
  cat *_2.filt.fastq > "$fq2"
  rm *.filt.*
  gzip *fastq
  cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/lib144
done


# Completion message
echo ""
echo "Completed script: $(date +%d%b%Y_%H:%M:%S)"
