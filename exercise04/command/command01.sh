# command01.sh
# 1. Find protein-coding genes from ./data/unknown_bacteria.fasta with Prodigal.
prodigal -i ./data/unknown_bacteria.fasta -a ./data/unknown_bacteria.proteins.faa -f gff -o ./data/unknown_bacteria.gtf
# 2. Count the number of proteins in unknown_bacteria.proteins.faa and
# save the count to ./result/unknown_bacteria.protein.count.txt.
grep ">" ./data/unknown_bacteria.proteins.faa | wc -l > ./result/unknown_bacteria.protein.count.txt
