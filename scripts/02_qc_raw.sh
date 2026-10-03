#!/bin/bash
# Step 2: Quality control of raw reads with FastQC and MultiQC
# Run from the project folder: bash scripts/02_qc_raw.sh
# Requires the rnaseq conda environment: conda activate rnaseq

# Make sure the output folder exists (FastQC won't create it)
mkdir -p qc

# Run FastQC on all raw FASTQ files
fastqc -o qc raw-data/*.fastq.gz

# Combine all FastQC reports into one MultiQC summary report
multiqc qc -o qc -f
