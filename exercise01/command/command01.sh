# 1. Print your student number and github ID and copy the printed result to "student_id.txt".
# The format should be like "2021-#####,harryporter".
echo 2015-15646,parkjihoo > ./result/student_id.txt
# 2. Download the fasta file with NCBI accession. The downloaded file should be named like "NC_XXXXXX.X.fasta" (No result file)
# - Sequence name: SARS_CoV_2_Wuhan_Hu_1
# - NCBI accession number: NC_045512.2
# - Download link:
#     - https://www.ncbi.nlm.nih.gov/search/api/sequence/NC_045512.2/?report=fasta
wget -O NC_045512.2.fasta \
https://www.ncbi.nlm.nih.gov/search/api/sequence/NC_045512.2/?report=fasta
