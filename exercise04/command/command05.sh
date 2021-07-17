# command05.sh
# 1. Download and extract the gzipped GTF file of D. melanogaster from the link.
#    Link: ftp://ftp.ensembl.org/pub/release-103/gtf/drosophila_melanogaster/Drosophila_melanogaster.BDGP6.32.103.gtf.gz
#    Convert the chromosome names of downloaded GTF file to have "chr" at the beginning.
#    e.g., 3R --> chr3R
#    Save the GTF file as ./data/d_melanogaster.genes.gtf
wget -O d_melanogaster.genes.gtf.gz ftp://ftp.ensembl.org/pub/release-103/gtf/drosophila_melanogaster/Drosophila_melanogaster.BDGP6.32.103.gtf.gz
gunzip d_melanogaster.genes.gtf.gz
awk -F'\t' '{print "chr"$0}' d_melanogaster.genes.gtf > ./data/d_melanogaster.genes.gtf
# 2. Assemble and quantify transcripts for ./data/GSM461177.sorted.bam
#    and `./data/GSM461180.sorted.bam with StringTie
stringtie -G ./data/d_melanogaster.genes.gtf -o ./result/GSM461177.gtf -A ./result/GSM461177.tsv ./data/GSM461177.sorted.bam
stringtie -G ./data/d_melanogaster.genes.gtf -o ./result/GSM461180.gtf -A ./result/GSM461180.tsv ./data/GSM461180.sorted.bam
# 3. Find the FPKM and TPM of pasilla gene in two TSV files and fill in the ./result/pasilla.csv
grep "FBgn0261552" ./result/GSM461177.tsv
grep "FBgn0261552" ./result/GSM461180.tsv
# 4. Run `samtools coverage` for *pasilla* gene in `GSM461177.sorted.bam` and `GSM461180.sorted.bam`
#    and save the ASCII-art histograms as. `./result/*.pasilla.coverage`.
#    With the results from Step 3 and 4, find the sample with RNAi experiment on pasilla gene
#    and save the sample ID (GSM461177 or GSM461180) to ./result/sample_with_RNAi.txt
samtools coverage -A -r chr3R:9417940-9455500 -w 80 ./data/GSM461177.sorted.bam > ./result/GSM461177.pasilla.coverage
samtools coverage -A -r chr3R:9417940-9455500 -w 80 ./data/GSM461180.sorted.bam > ./result/GSM461180.pasilla.coverage
# 5. Get top 5 highly expressed genes (based on TPM) from ./result/GSM461177.tsv and ./result/GSM461180.tsv
#    Save the lines of top 5 genes to ./result/GSM461177.top5.tsv and ./result/GSM461180.top5.tsv
awk -F'\t' '$2 != "-" {print $0}' ./result/GSM461177.tsv | sort -k9rn | head -n 5 > ./result/GSM461177.top5.tsv
awk -F'\t' '$2 != "-" {print $0}' ./result/GSM461180.tsv | sort -k9rn | head -n 5 > ./result/GSM461180.top5.tsv
