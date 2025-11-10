# DNA Sequence Analysis - Assignment 4

## Author
Tejaswini Kakumanu

## Submission Date
November 9, 2025

## Programming Language
R (tested on version 4.3.1)

## Purpose
This R script analyzes a DNA sequence from the file `chr1_GL383518v1_alt`. The main tasks performed by the script are:  

- Reading the DNA sequence from a FASTA file.  
- Printing specific nucleotides at given positions.  
- Generating the reverse complement of the sequence.  
- Counting the number of each nucleotide (A, C, G, T) per kilobase.  
- Creating data frames for nucleotide counts.  
- Calculating total nucleotides per kilobase and explaining differences, if any.

## Required Files
1. **chr1_GL383518v1_alt (1).fa**  
   - The FASTA file containing the DNA sequence.  
   - Ensure it is in the same folder as the script, or update the path in the script.

2. **Assignment 4.R**  
   - The R script containing all the analysis steps.

## Software Requirements
- R (version 4.0 or higher)  
- No additional R packages are required; the script uses only base R functions.

## Instructions for Running
1. Open RStudio or any R environment.  
2. Place the FASTA file in the folder where you will run the script.  
3. Open `Assignment 4.R` in RStudio.  
4. Make sure the file path in the script matches your FASTA file location:

```r
sequence_file <- "C:/Users/vijay/Downloads/chr1_GL383518v1_alt (1).fa"

