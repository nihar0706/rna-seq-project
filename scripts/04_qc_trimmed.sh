#!/bin/bash
# Step 4: QC of trimmed reads
# Run from the project folder: bash scripts/04_qc_trimmed.sh
# Requires the rnaseq conda environment: conda activate rnaseq

mkdir -p qc/trimmed
fastqc -o qc/trimmed trimmed/*.fastq.gz
multiqc qc/trimmed -o qc/trimmed -f
