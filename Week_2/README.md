Assignment 1 | Introduction to Unix

Programmer Name: Tejaswini Kakumanu

Language Used: Unix Shell Script
Date: 14th September 2025

Project Overview:

This Unix shell script is designed to automatically download all secondary assemblies for human chromosome 1 from the UCSC Genome Browser. It extracts the downloaded files, organizes them into a specific directory, and generates a detailed summary file that includes information such as filenames, line counts, and sample contents.

Prerequisites:

wget: Used for fetching chromosome 1 assemblies (Tested with version 1.21.5)

gunzip: Required to decompress the .gz files after download

How to Run the Script:

Download and save the script with the name UnixASG.sh.

Open your terminal.

Use the cd command to navigate to the folder containing the script.

Execute the script with the following command:

./UnixASG.sh

Output Files and Folders:

Informatics_573/: A directory that stores all downloaded and unzipped chromosome 1 assembly files.

data_summary.txt: A text file summarizing each downloaded file. It includes:

The filename

The first 10 lines of its contents

The total number of lines in each file
