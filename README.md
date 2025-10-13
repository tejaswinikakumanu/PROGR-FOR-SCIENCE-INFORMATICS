# Assignment 2 | Differential Gene Expression Analysis

**Programmer:** Tejaswini Kakumanu  
---

## Project Overview

This assignment includes a Python notebook designed to perform **Differential Gene Expression (DGE) Analysis**.  
The notebook loads gene expression and sample information from three separate files to identify genes that show significant differences in expression between **tumor** and **normal** tissue samples.  

It then generates a series of visualizations to illustrate these findings, including the distribution and expression patterns of the identified **Differentially Expressed Genes (DEGs)**.

---

## Prerequisites

- **pandas**: Library for data manipulation and analysis.  
- **numpy**: Library for numerical operations.  
- **matplotlib**: Library for creating static visualizations.  
- **seaborn**: High-level data visualization library based on matplotlib.  
- **scipy**: Library for scientific and technical computing.  
- **openpyxl**: Required dependency for pandas to read `.xlsx` files.

---

## Installation

Install all required libraries before running the notebook:

---

## How to Run the Notebook

1. Open **Jupyter Notebook** or **JupyterLab**.  
2. Load the notebook file 
3. Run all cells sequentially by:
   - Clicking the **Run** button, or  
   - Pressing **Shift + Enter** for each cell.  

---

## Output

All outputs are displayed directly within the notebook, including the following five plots:

1. **Histogram** showing the number of Differentially Expressed Genes (DEGs) on each chromosome.  
2. **Histogram** showing the same distribution separated by sample type (**Tumor vs. Normal**).  
3. **Bar chart** illustrating the percentage of DEGs more highly expressed in tumor samples.  
4. **Heatmap** visualizing the expression patterns of DEGs across all samples.  
5. **Clustermap** grouping similar genes and samples to reveal expression pattern relationships.  

---

