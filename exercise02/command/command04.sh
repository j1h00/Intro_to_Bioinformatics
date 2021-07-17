# command04.sh
# 1.  Extract the distinct genomic feature types (e.g. gene, exon, transcript ...) from the GTF file.
#     Sort the values alphabetically and save them to result04_1.txt.
awk '{print $3}' ./data/d_melanogaster.genes.gtf | sort | uniq > ./result/result04_1.txt
# 2. Find the line in which the feature type is "gene" and the gene name is "Raf".
#    Save the line to **result04_2.txt**.
awk '$3 == "gene" {print $0;}' ./data/d_melanogaster.genes.gtf | grep "Raf" > ./result/result04_2.txt
# 3. The "Raf" gene has multiple transcripts. Find all transcripts and store the
#    attribute "transcript_name" (e.g., transcript_name "Raf-RE";) to result04_3.txt.
grep "Raf" ./data/d_melanogaster.genes.gtf | awk '$3 == "transcript" {print $0;}' | grep -o "transcript_name.*" | awk '{print $1,$2}' > ./result/result04_3.txt
# 4. Count the number of exons of each transcript from "Raf" gene and save the count to result04_4.csv.
#    Write the transcript names as column 1 and the count of exons as column 2.
grep "Raf" ./data/d_melanogaster.genes.gtf | awk '$3 == "exon" {print $0;}' | grep -o "transcript_name.*" | awk '{print $2;}' | tr -d '"|;' | uniq -c | awk '{print $2","$1}' > ./result/result04_4.csv
# 5. Calculate the total exon length of transcripts from "Raf" gene and save the result to result04_5.csv.
#    Write the transcript names as column 1 and the length of exons as column 2.
#    The position of GTF is 1-based which means the 100nt-length region from 1st
#    position to 100th position in chromosome 1 is represented as "chr1 1 100".
#    You should consider this when calculating the length from position indices.
grep "Raf" ./data/d_melanogaster.genes.gtf | awk '$3 == "exon" {print $0;}' | grep -w "Raf-R[EA]" | awk '$22 == "\"Raf-RE\";" {sum+=$5-$4+1}END{print "Raf-RE,"sum} $22 == "\"Raf-RA\";" {sum1+= $5-$4+1}END{print "Raf-RA,"sum1}' > ./result/result04_5.csv
