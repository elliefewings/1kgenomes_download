#!/bin/bash
# batch_generator_filedwnld_v1.sh
# Download fastqs in batches of 24
# Ellie Fewings, 08Jul2016

# Start message
echo "Started script: $(date +%d%b%Y_%H:%M:%S)"
echo ""

cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/

#Split file into lines of 48 to create batchs of download files
split -l 48 -d /share/CACHEDEV1_DATA/eleanor/1kgenomes/1kgen_files_v3_todownload.txt fastq_dwnld_batch

#Create batch directories and download
for num in {0..15}; do
  name="batch""$num" 
  if [ "$num" -lt "10" ]; then
    name="batch0""$num"
  fi
  mkdir "$name"
  mv *"$name" "$name"/
  cd "$name"
  wget -i *"$name"
  cd /share/CACHEDEV1_DATA/eleanor/1kgenomes/fastq/
done

# Completion message
echo ""
echo "Completed script: $(date +%d%b%Y_%H:%M:%S)"
