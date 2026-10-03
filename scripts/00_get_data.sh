#!/bin/bash
# Step 0: Get the raw data into the project
# The three FASTQ files are simulated Illumina-format reads for practice,
# downloaded to the Windows Downloads folder and copied into raw-data/.
# Run from the project folder: bash scripts/00_get_data.sh

mkdir -p raw-data
cp "/mnt/c/Users/Nihar Naveen/Downloads/"*.fastq.gz raw-data/

