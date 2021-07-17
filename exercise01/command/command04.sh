# 1. How many lines are in this fasta file except for the header line? (The header lines start with "#".)
#    Print the number of lines except header lines and save the number to "result04_1.txt".
grep -v ">" ./data/SARS_CoV_2_Wuhan_Hu_1/NC_045512.2.fasta | wc -l
# 2. How many lines of this fasta file contain "AAAAA"?
#    Print the number of lines with "AAAAA" and save the number to "result04_2.txt".
grep "AAAAA" ./data/SARS_CoV_2_Wuhan_Hu_1/NC_045512.2.fasta | wc -l
# 3. From the fasta file, print the first 5 lines containing "GGTTC" and copy the printed result to "result04_3.txt".
grep --color "GGTTC" ./data/SARS_CoV_2_Wuhan_Hu_1/NC_045512.2.fasta | head -n 5
