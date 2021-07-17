# command03.sh
# 1. Extract unique chromosome names in "d_melanogaster.genes.gtf" and save it to result03_1.txt.
#    You can find the structure of GTF file from https://en.wikipedia.org/wiki/General_feature_format
#    or from the lecture slides.
grep -v "#" ./data/d_melanogaster.genes.gtf | awk '{print $1}' | sort | uniq > ./result/result03_1.txt
# 2. Count genes in each chromosome and find the chromosomes which have 100 or more genes.
#    Sort chromosome names alphabetically and write the chromosome names as column 1 and
#    the count of genes as column 2 to result03_2.csv.
#    Columns in CSV file, which means Comma-Separated Values, should be separated with comma, ",".
#    When counting the number of genes in a chromosome, count the lines of which the feature type is "gene".
grep -v "#" ./data/d_melanogaster.genes.gtf | awk '$3 == "gene" {print $1}' | sort | uniq -c | awk '$1 >= 100 {print $2","$1}' > ./result/result03_2.csv
