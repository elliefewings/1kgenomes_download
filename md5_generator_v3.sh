#!/bin/bash
# md5_generator_v3.sh
# Generate md5 checksums for paired fastq files
# Ellie Fewings, 08Jul2016

# Start message
echo "Started script: $(date +%d%b%Y_%H:%M:%S)"
echo ""

cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/

#Create samples list for all files in all batch directories
for num in {0..15}; do
  name="batch""$num" 
  if [ "$num" -lt "10" ]; then
    name="batch0""$num"
  fi
  cd "$name"/lane1/
  samples="samples_""$name"".txt"
  ls | tr '\n' '\n' | cut -c-9 | sort -u | head -24 > "$samples"
  cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/
done

#Generate md5 sums for all samples in batch directories
for num in {0..15}; do
  name="batch""$num" 
  if [ "$num" -lt "10" ]; then
    name="batch0""$num"
  fi
  cd "$name"/lane1/
  IFS=$'\n'
  set -f
  samples_list="samples_""$name"".txt"
  for sample in $(cat "$samples_list") ; do
    md5_file="$sample"".md5"
    fq1="$sample""_1.filt.fastq.gz"
    fq2="$sample""_2.filt.fastq.gz"    
    md5sum "$fq1" "$fq2" > "$md5_file"
  done
  cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/
done

# Completion message
echo ""
echo "Completed script: $(date +%d%b%Y_%H:%M:%S)"

