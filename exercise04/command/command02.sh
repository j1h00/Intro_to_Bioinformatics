# command02.sh
# 1. Download and setup Swiss-Prot database for MMSeqs in the ./db folder.
mmseqs databases UniProtKB/Swiss-Prot ./db/swissprot tmp
# 2. Run easy-search workflow for unknown_bacteria.proteins.faa against Swiss-Prot
#    and save the result as ./result/unknown_bacteria.proteins.aln.swissprot.tsv
mmseqs easy-search ./data/unknown_bacteria.proteins.faa ./db/swissprot ./result/unknown_bacteria.proteins.aln.swissprot.tsv tmp â--format-outputâ"query,target,evalue,alnlen,cigar,taxname,theader"
# 3. Run Mmseqs2 easy-taxonomy workflow for unknown_bacteria.proteins.faa and
#    save the results with the prefix ./result/unknown_bacteria.taxonomy
#    Identify the strain of the unknown genome with ./result/unknown_bacteria.taxonomy_report and
#    save the scietific name of the strain at ./result/unknown_bacteria.strain.txt
mmseqs easy-taxonomy ./data/unknown_bacteria.proteins.faa ./db/swissprot ./result/unknown_bacteria.taxonomy tmp
# 4. Repeat easy-search workflow analysis with ./data/unknown_transcripts.fasta as in Step 2.
#    Save the result as ./result/unknown_transcripts.aln.swissprot.tsv and copy
#    the lines of best hits of two transcripts to ./result/unknown_transcripts.proteins.txt
mmseqs easy-search ./data/unknown_transcripts.fasta ./db/swissprot ./result/unknown_transcripts.aln.swissprot.tsv tmp --format-output "query,target,evalue,alnlen,cigar,taxname,theader"
