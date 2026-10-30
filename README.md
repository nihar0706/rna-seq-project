# Learning bulk-RNA sequencing from raw reads to differential expression

Two parts. Two datasets used for two different learning purposes.

## Part 1: Inspected FASTQ files, ran QC and trimming.
Data: three practice illumina FASTQ files (not a real experiment)

- 00_get_data.sh copies three .fastq.gz files into raw-data/. (change the path to point to your file location)
    - what a FASTQ file looks like:
      ```
         Line 1- @SRR5......:1:N:0 - read's name and ID
         Line 2- ATGCTC.........TG - sequence read by the machine
         Line 3- +                 - separator
         Line 4- IIIF...........I5 - quality score for each base
      ```
- Output: three .fastq.gz files copied in /raw-data

- 01_explore_fastq.sh does three things with plain shell: counts lines, greps for the adapter sequence, and finds the most frequent          sequence per sample. ( grep-c N overcounts because every header contains 1:N:0 meaning that the sequence was passed by filter)
- Results: 1.No of reads per sample (no of lines/4):
```
 Sample 1: 2500
 Sample 2: 3200
 Sample 3: 1800
```
           2.Adaptor containing reads:
  ```
  Sample 1: 125
  Sample 2: 480
  Sample 3: 90
  ```

## Progress
- Inspected FASTQ files and counted reads with shell loops
- Detected adapter contamination (sample2: 15%) and an overrepresented sequence
- Ran FastQC and MultiQC
- Adapter trimming with fastp
- Ran FastQC and MultiQC on the trimmed data
- Ran Salmon analysis for comparing the reads against the transcriptome
- Generated the quant-sf file
- Imported into DeSeq2 in R using tximport

