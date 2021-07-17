# 1. Restriction enzymes cut DNA by acting only on certain motifs (motif means specific sequences of bases).
# EcoRI is a well-known restriction enzyme from E. coli and is used in various molecular
# genetics techniques. Identify the motif of EcoRI, print the number of motifs in the fasta file and save the number to "result05_1.txt".
# > EcoRI motif consists of 6 bases.
# > Don't consider the sites split by the new line character - just count the sites fully contained in a line.
grep -o "GAATTC" ./data/SARS_CoV_2_Wuhan_Hu_1/NC_045512.2.fasta | wc -l
# 2. Print the number of HincII recognition sites in the fasta file and save the number to "result05_2.txt".
grep -o "GTTAAC\|GTCGAC" ./data/SARS_CoV_2_Wuhan_Hu_1/NC_045512.2.fasta | wc -l
# 3. Print the number of bases (A, T, G, C) in the fasta file and fill in the numbers of "result05_3.csv".
grep -v ">" ./data/SARS_CoV_2_Wuhan_Hu_1/NC_045512.2.fasta | grep -o "A" | wc -l
grep -v ">" ./data/SARS_CoV_2_Wuhan_Hu_1/NC_045512.2.fasta | grep -o "T" | wc -l
grep -v ">" ./data/SARS_CoV_2_Wuhan_Hu_1/NC_045512.2.fasta | grep -o "G" | wc -l
grep -v ">" ./data/SARS_CoV_2_Wuhan_Hu_1/NC_045512.2.fasta | grep -o "C" | wc -l
