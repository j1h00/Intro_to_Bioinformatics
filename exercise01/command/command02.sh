# 1. Create a directory, named as the given sequence name, "SARS_CoV_2_Wuhan_Hu_1", in data directory.
#    Move the downloaded fasta file to the directory created. (No result file)
mkdir ./data
mkdir ./data/SARS_CoV_2_Wuhan_Hu_1
mv ./NC_045512.2.fasta ./data/SARS_CoV_2_Wuhan_Hu_1
# 2. Print the list of files inside the data directory and copy the printed result to "result02.txt".
echo $(ls ./data/) > ./result/result02.txt
