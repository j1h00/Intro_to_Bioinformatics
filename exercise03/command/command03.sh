# command03.sh
# 1. Align the reference genome and scaffolds assembled with SPAdes with MUMMER.
#    Save the output of MUMMER as sars_cov_2_k*.mums in result directory. (Result files: sars_cov_2_k*.mums)
mummer ./data/NC_045512.2.fasta ./result/sars_cov_2_k21.fasta > ./result/sars_cov_2_k21.mums
mummer ./data/NC_045512.2.fasta ./result/sars_cov_2_k77.fasta > ./result/sars_cov_2_k77.mums
mummer ./data/NC_045512.2.fasta ./result/sars_cov_2_k127.fasta > ./result/sars_cov_2_k127.mums
# 2. Visualize the alignment result with mummerplot.
#    Save the output plot as sars_cov_2_k*.png in the result directory. (Result files: sars_cov_2_k*.png)
mummerplot --png -p ./result/sars_cov_2_k21 -R ./data/NC_045512.2.fasta -Q ./result/sars_cov_2_k21.fasta ./result/sars_cov_2_k21.mums
mummerplot --png -p ./result/sars_cov_2_k77 -R ./data/NC_045512.2.fasta -Q ./result/sars_cov_2_k77.fasta ./result/sars_cov_2_k77.mums
mummerplot --png -p ./result/sars_cov_2_k127 -R ./data/NC_045512.2.fasta -Q ./result/sars_cov_2_k127.fasta ./result/sars_cov_2_k127.mums
# 3. Generate snp report for sars_cov_2_k127.fasta and save the snp report as
#    sars_cov_2_k127.snps in the result directory. (Result file: sars_cov_2_k127.snps)
nucmer --maxmatch ./data/NC_045512.2.fasta ./result/sars_cov_2_k127.fasta
delta-filter -r -q out.delta > o.filter
show-snps -r -I -T -x 10 o.filter > ./result/sars_cov_2_k127.snps
# 4. Find out the shared SNPs between the clade and the sars_cov_2_k127 assembly by joining.
#    With the SNPs, find the clade which shares most SNPs with the sars_cov_2_k127 assembly (Result file: clade_name.txt).
awk -F'\t' '{print $0}' <(for txt in data/clade/*.txt; do
        filename=$(basename "$txt")
        fname="${filename%.*}"
        echo "$fname" | tr '\n' '\t'
        ./join.awk ./result/sars_cov_2_k127.snps $txt | wc -l | tr '\n' '\t'
        cat $txt | wc -l
done) | sort -k2rn -k3n | awk 'NR == 1 {print $1}' > ./result/clade_name.txt
