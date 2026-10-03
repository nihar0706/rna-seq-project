#!/bin/bash
# Step 1: Manual exploration of FASTQ files with shell commands
# Run from the project folder: bash scripts/01_explore_fastq.sh

mkdir -p results

# 1. Look at the first two reads of sample 1 (each read = 4 lines)
echo "== First two reads of sample1 =="
zcat raw-data/sample1_R1.fastq.gz | head -n 8

# 2. Count lines in each file (number of reads = lines / 4)
#    Remove any old output first, so >> doesn't create duplicate entries
echo "== Line counts (divide by 4 for reads) =="
rm -f results/read_counts.txt
for filename in raw-data/*.fastq.gz
do
    echo $filename >> results/read_counts.txt
    zcat $filename | wc -l >> results/read_counts.txt
done
cat results/read_counts.txt

# 3. Count reads containing the start of the Illumina adapter
echo "== Adapter-containing reads =="
for filename in raw-data/*.fastq.gz
do
    echo $filename
    zcat $filename | grep -c AGATCGGAAGAGC
done

# 4. Note: 'grep -c N' overcounts reads with unknown bases, because every
#    header line contains "1:N:0" (N = read passed the quality filter)

# 5. Find the most frequent sequence in each sample
echo "== Most frequent sequence per sample =="
for filename in raw-data/*.fastq.gz
do
    echo $filename
    zcat $filename | paste - - - - | cut -f 2 | sort | uniq -c | sort -nr | head -n 1
done
