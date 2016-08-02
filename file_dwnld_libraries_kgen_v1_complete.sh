#!/bin/bash
# file_dwnld_libraries_kgen_v2_complete.sh
# Download multiple files for samples and concatenate
# Ellie Fewings, 27Jul2016

# Start message
echo "Started script: $(date +%d%b%Y_%H:%M:%S)"
echo ""

cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/

libraries=("lib144" "lib30" "lib38" "lib4" "lib42" "lib44" "lib46")

for lib in libraries
  cd "${lib}"
  samples_file=$(cat *"samples.txt")
  IFS=$'\n'
  set -f 
  for sample in ${samples_file}; do
    mkdir "$sample"
    echo "$sample"
    files="${lib}""_""${sample}""_1kgenomes_eur_extended_fem_onefile_v4_todownload.txt"
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
    cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/"${lib}"
  done
  cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/
done

# Completion message
echo ""
echo "Completed script: $(date +%d%b%Y_%H:%M:%S)"
