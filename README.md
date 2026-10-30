Learning bulk-RNA sequencing from raw reads to differential expression

## Progress
- Inspected FASTQ files and counted reads with shell loops
- Detected adapter contamination (sample2: 15%) and an overrepresented sequence
- Ran FastQC and MultiQC
- Adapter trimming with fastp
- Ran FastQC and MultiQC on the trimmed data
- Ran Salmon analysis for comparing the reads against the transcriptome
- Generated the quant-sf file
- Imported into DeSeq2 in R using tximport

