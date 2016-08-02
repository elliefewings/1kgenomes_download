#!/bin/bash
# samplestxt_generator_v2.sh
# Generate samples.txt for fastq files
# Ellie Fewings, 08Jul2016

# Start message
echo "Started script: $(date +%d%b%Y_%H:%M:%S)"
echo ""

cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/

#Generate samples.txt in batch directories
for num in {0..1}; do
  name="batch""$num" 
  if [ "$num" -lt "10" ]; then
    name="batch0""$num"
  fi
  cd "$name"/lane1/
  IFS=$'\n'
  set -f
  samples_list="samples_""$name"".txt"
  title="sample	fastq1	fastq2	md5"
  echo "$title" > samples.txt
  for sample in $(cat "$samples_list") ; do
    md5_file="$sample"".md5"
    fq1="$sample""_1.filt.fastq.gz"
    fq2="$sample""_2.filt.fastq.gz"    
    echo "$sample""	""$fq1""	""$fq2""	""$md5_file" >> samples.txt
  done
  cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/
done

# Completion message
echo ""
echo "Completed script: $(date +%d%b%Y_%H:%M:%S)"

