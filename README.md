# Differential Gene Expression Analysis

**Programmer Name:** Tejaswini  
**Language of the Script:** R (RStudio 4.3.1)  
**Date:** 23-Nov-2025  

## Description
This project performs differential gene expression (DEG) analysis between Tumor and Normal samples. The script:

- Loads gene expression, gene information, and sample metadata.
- Renames sample columns based on phenotype.
- Splits data into Tumor and Normal groups.
- Computes average gene expression and log2 fold changes.
- Identifies DEGs with |log2FC| > 5 and annotates them with gene info.
- Performs EDA with histograms and bar plots.
- Visualizes gene expression using heatmaps and clustermaps.

## Requirements
- R 4.3.1 or higher
- RStudio
- Packages: `tidyverse`, `readxl`, `readr`, `pheatmap`, `ComplexHeatmap`, `circlize`, `rlang`
- Data files:
  - `Gene_Expression_Data.xlsx`
  - `Gene_Information.csv`
  - `Sample_Information.tsv`

## Steps to Execute the Script
1. Download `Differential_Gene_Expression.R` into your local system.
2. Ensure all required data files are placed correctly or update file paths in the script.
3. Open RStudio and set the working directory to the folder containing the script:
   ```r
   setwd("path/to/your/folder")



