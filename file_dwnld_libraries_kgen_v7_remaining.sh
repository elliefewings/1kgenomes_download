#!/bin/bash
# batch_generator_filedwnld_v1.sh
# Download fastqs in batches of 24
# Ellie Fewings, 08Aug2016

# Start message
echo "Started script: $(date +%d%b%Y_%H:%M:%S)"
echo ""
cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/
lib=("lib42") 
for library in ${lib[@]}; do
  cd ${library}
  samples_file=$(cat *"samples.txt")   
  for sample in ${samples_file}; do
    mkdir "$sample"
    echo "$sample"
    files="${library}""_""${sample}""_1kgenomes_eur_extended_fem_onefile_v5_http_todownload.txt"
    cp ${files} ${sample}
    cd ${sample}
    wget -nc -i ${files}
    pe1=(*_1.filt.fastq.gz)
    pe2=(*_2.filt.fastq.gz)
    fq1="$sample""_1.fastq.gz"
    fq2="$sample""_2.fastq.gz"
    cat ${pe1[@]} > ${fq1}
    cat ${pe2[@]} > ${fq2}
    rm *.filt.*
    cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/${library}
  done
  cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/
done


# Completion message
echo ""
echo "Completed script: $(date +%d%b%Y_%H:%M:%S)"
