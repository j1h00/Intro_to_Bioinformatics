# command02.sh
# The first few lines of GTF file begin with "#", and these lines are called as "header lines".
# 1. Use a command to extract only the header line from a GTF file
#    and store the result to **result02_1.txt** in the "result" directory.
grep "#" ./data/d_melanogaster.genes.gtf > ./result/result02_1.txt
# 2. Count the number of lines in the GTF file except header lines and save the number to result02_2.txt.
grep -v "#" ./data/d_melanogaster.genes.gtf | wc -l > ./result/result02_2.txt
