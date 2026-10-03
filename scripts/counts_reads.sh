for files in *.fastq.gz; do echo $file >>result.txt; zcat *.fastq.gz | wc -l >> result.txt; done
for files in *.fastq.gz; do echo $file >>result.txt; zcat *.fastq.gz | grep -c AGATCGGAAGAGC >> result.txt; done
