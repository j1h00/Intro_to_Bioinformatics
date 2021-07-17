## command05.sh
# 1. Download E. coli GTF file and unzip it as "e_coli.genes.gtf" in data directory. (No result file)
# Link: https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.gtf.gz
wget -O ./data/e_coli.genes.gtf.gz https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.gtf.gz
gunzip ./data/e_coli.genes.gtf.gz
# 2. Count the genes in the positive (+) and negative (-) strand of E. coli genome
#    and save the counts to result05_2.csv.
awk '$3 == "gene" {print $7;}' ./data/e_coli.genes.gtf  | sort | uniq -c | awk '{print $2","$1}' > ./result/result05_2.csv
# 3. Compare the distinct genomic feature types of d_melanogaster.genes.gtf and e_coli.genes.gtf.
#    Find the features which only exist in *D. melanogaster* and not in *E. coli*.
#    Sort the values alphabetically and write them to **result05_3.txt**.
diff <(awk '{print $3}' ./data/d_melanogaster.genes.gtf | sort | uniq) <(awk '{print $3}' ./data/e_coli.genes.gtf | sort |uniq) | awk '$1 == "<" {print $2}' > ./result/result05_3.txt
