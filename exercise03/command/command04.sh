# command04.sh
# 1. Quast is a quality assessment tool for genome assembly. Run Quast for
#    sars_cov_2_k21.fasta, sars_cov_2_k77.fasta and sars_cov_2_k127.fasta.
#    For each K, save the result at "./sars_cov_2_k*/quast". (No result file)

quast.py ./result/sars_cov_2_k21.fasta \
-r ./data/NC_045512.2.fasta \
-g ./data/sars_cov_2.genes.gtf \
-o ./sars_cov_2_k21/quast

quast.py ./result/sars_cov_2_k77.fasta \
-r ./data/NC_045512.2.fasta \
-g ./data/sars_cov_2.genes.gtf \
-o ./sars_cov_2_k77/quast

quast.py ./result/sars_cov_2_k127.fasta \
-r ./data/NC_045512.2.fasta \
-g ./data/sars_cov_2.genes.gtf \
-o ./sars_cov_2_k127/quast

# 2. Among the output of Quast, find "report.pdf" and get these values of the assemblies:
#    - Number of contig, N50, GC-content percentage of assembly.
#    Fill in the numbers of the "assembly_result.csv" in the result directory with metrics found.
