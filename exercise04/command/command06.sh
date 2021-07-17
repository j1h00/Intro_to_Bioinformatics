# command06.sh
# 1. Join the `./result/GSM461177.tsv` and `./result/GSM461180.tsv` with the `Gene ID` column.
#    Only consider genes with gene names (Ignore transcripts of which gene names are "-").
./join.awk ./result/GSM461177.tsv ./result/GSM461180.tsv | awk -F'\t' '($2 != "-") && ($10 != "-") {print $0}' > joined.tsv
# 2. Calculate the log2 fold change of all genes between wild-type sample
#    and the *pasilla* RNAi sample and find the top 25 genes and bottom 25 genes
#    based on log2 fold change. Save the top 25 genes and their log2 fold change to
#    ./result/pasilla.log2FC.top25.csv and those of bottom 25 genes to
#    ./result/pasilla.log2FC.bottom25.csv
awk -F'\t' '$2 != "." {print $2"\t"(($9+1)/($18+1))}' ./joined.tsv | sort -k2rn | awk -F'\t' '{print $1","(log($2)/log(2))}' | head -n 25 > ./result/pasilla.log2FC.top25.csv
awk -F'\t' '$2 != "." {print $2"\t"(($9+1)/($18+1))}' ./joined.tsv | sort -k2rn | awk -F'\t' '{print $1","(log($2)/log(2))}' | tail -n 25 > ./result/pasilla.log2FC.bottom25.csv
