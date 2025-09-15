# Navigate to the user's home directory.
cd ~

# Create and enter the "Informatics_573" directory.
mkdir -p Informatics_573 && cd Informatics_573

# Download all secondary assemblies for human chromosome 1.
wget -r -np -nd -A 'chr1_*' -R 'chr1.fa.gz' https://hgdownload.soe.ucsc.edu/goldenPath/hg38/chromosomes/

# Unzip all downloaded files starting with 'chr1_'.
gunzip chr1_*

# Create and populate "data_summary.txt" with file information.
# The output of 'ls -l' is piped to a file, and subsequent data is appended.
ls -l > data_summary.txt

# Append the first 10 lines of each chromosome 1 assembly.
head chr1_* >> data_summary.txt

# Append the name and line count for each assembly.
wc -l chr1_* >> data_summary.txt

# Display the final contents of the summary file.
cat data_summary.txt