# command02.sh
# 1. Execute SPAdes 3 times with these k values; 21, 77, and 127
# Save the result to each output directory.
#   - k=21: ./sars_cov_2_k21
#   - k=77: ./sars_cov_2_k77
#   - k=127: ./sars_cov_2_k127
# The output directory can be set by adding "-o" option.
# Run SPAdes with "--only-assember" option to speed up.
spades.py -k 21 -o ./sars_cov_2_k21 -1 ./data/SRR13668359_1.fastq.gz -2 ./data/SRR13668359_2.fastq.gz --only-assembler
spades.py -k 77 -o ./sars_cov_2_k77 -1 ./data/SRR13668359_1.fastq.gz -2 ./data/SRR13668359_2.fastq.gz --only-assembler
spades.py -k 127 -o ./sars_cov_2_k127 -1 ./data/SRR13668359_1.fastq.gz -2 ./data/SRR13668359_2.fastq.gz --only-assembler
# 2. Copy scaffolds.fasta files from the output directories of previous step to result directory and name
#    them as sars_cov_2_k*.fasta. (Result file: sars_cov_2_k*.fasta)
#    You can copy files with "cp" command. The usage of "cp" command is quite similar to "mv" command.
cp ./sars_cov_2_k21/scaffolds.fasta ./result/sars_cov_2_k21.fasta
cp ./sars_cov_2_k77/scaffolds.fasta ./result/sars_cov_2_k77.fasta
cp ./sars_cov_2_k127/scaffolds.fasta ./result/sars_cov_2_k127.fasta
