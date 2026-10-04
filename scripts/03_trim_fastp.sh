#!/bin/bash
# Step 3: Trim adapters and low-quality reads with fastp
# Run from the project folder: bash scripts/03_trim_fastp.sh
# Requires the rnaseq conda environment: conda activate rnaseq

mkdir -p trimmed qc

for file in raw-data/*_R1.fastq.gz
do
    name=$(basename $file _R1.fastq.gz)
    echo "Trimming $name"

    fastp -i $file \
          -o trimmed/${name}_R1.trimmed.fastq.gz \
          -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
          -h qc/${name}_fastp.html \
          -j qc/${name}_fastp.json
done
