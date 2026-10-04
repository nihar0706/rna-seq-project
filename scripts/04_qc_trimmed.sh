mkdir -p qc/trimmed
fastqc -oqc/trimmed trimmed/*.fastq.gz
multiqc qc -o qc -f


