# command04.sh
# 1. Convert the HISAT2-mapped SAM files to BAM format with `samtools view` command.
samtools view -Sb ./data/GSM461177.sam > ./data/GSM461177.bam
samtools view -Sb ./data/GSM461180.sam > ./data/GSM461180.bam

# 2. Sort the BAM files from previous step with `samtools sort` command.
samtools sort ./data/GSM461177.bam > ./data/GSM461177.sorted.bam
samtools sort ./data/GSM461180.bam > ./data/GSM461180.sorted.bam

# 3. Make index files for sorted BAM files from previous step with `samtools index` command.
samtools index -b ./data/GSM461177.sorted.bam
