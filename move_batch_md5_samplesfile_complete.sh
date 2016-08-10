#!/bin/bash
# move_batch_md5_samplesfile_complete.sh
# Move concatenated fastqs in batches of 24, generate md5s and samples.txts
# Ellie Fewings, 02Aug2016

# Start message
echo "Started script: $(date +%d%b%Y_%H:%M:%S)"
echo ""

cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/
mkdir source_fastqs
#Move files into one directory
lib=("lib144" "lib2" "lib30" "lib38" "lib4" "lib42" "lib44" "lib46" "lib4_part2") 
for library in ${lib[@]}; do
  cd ${lib}
  samples_file=$(cat *"samples.txt")
  for sample in ${samples_file}; do
    cd ${sample}
    cp *fastq.gz /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/source_fastqs
    cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/${lib}
  done
  cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/
done

cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/source_fastqs

#Move files into batches
for n in {1..9}; do
  batch="batch""${n}"
  batch_loc="/share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/""${batch}"
  mkdir ${batch_loc}
  last24= $(ls -1 | tail -24)
  mv ${last24} ${batch_loc}
done

cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/

#Create md5sums
for n in {1..9}; do
  batch="batch""${n}"
  cd ${batch}
  for sample in $(ls -1 | cut -c1-7 | sort -u) ; do
    md5_file="$sample"".md5"
    fq1="$sample""_1.fastq.gz"
    fq2="$sample""_2.fastq.gz"    
    md5sum "$fq1" "$fq2" > "$md5_file"
  done
  cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/
done

#Create samples.txt
for n in {1..9}; do
  batch="batch""${n}" 
  cd ${batch}
  title="sample	fastq1	fastq2	md5"'\n
  "${title}" > samples.txt
  for sample in $(ls -1 | cut -c1-7 | sort -u) ; do
    md5_file="$sample"".md5"
    fq1="$sample""_1.filt.fastq.gz"
    fq2="$sample""_2.filt.fastq.gz"    
    "$sample""	""$fq1""	""$fq2""	""$md5_file"'\n' >> samples.txt
  done
  cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/
done

 
# Completion message
echo ""
echo "Completed script: $(date +%d%b%Y_%H:%M:%S)"
