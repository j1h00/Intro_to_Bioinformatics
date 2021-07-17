# command01.sh
# 1. Download Sars-Cov-2 reference fasta file as NC_045512.2.fasta in the data directory. (No result file)
#    Link: 'https://www.ncbi.nlm.nih.gov/search/api/sequence/NC_045512.2/?report=fasta'
wget -O ./data/NC_045512.2.fasta https://www.ncbi.nlm.nih.gov/search/api/sequence/NC_045512.2/?report=fasta
# 2. Download paired-end sequencing reads as SRR13668359_1.fastq.gz and SRR13668359_2.fastq.gz in the data directory (No result file)
#    Link for Read 1: ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR136/059/SRR13668359/SRR13668359_1.fastq.gz
#    Link for Read 2: ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR136/059/SRR13668359/SRR13668359_2.fastq.gz
#    You don't have to uncompress the downloaded files.
wget -O ./data/SRR13668359_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR136/059/SRR13668359/SRR13668359_1.fastq.gz
wget -O ./data/SRR13668359_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR136/059/SRR13668359/SRR13668359_2.fastq.gz
# 3. Download GTF file of Sars-Cov-2 and unzip it as sars_cov_2.genes.gtf in the data directory. (No result file)
#    Link: ftp://ftp.ensemblgenomes.org/pub/viruses/gtf/sars_cov_2/Sars_cov_2.ASM985889v3.101.gtf.gz
wget -O ./data/sars_cov_2.genes.gtf.gz ftp://ftp.ensemblgenomes.org/pub/viruses/gtf/sars_cov_2/Sars_cov_2.ASM985889v3.101.gtf.gz
gunzip ./data/sars_cov_2.genes.gtf.gz
