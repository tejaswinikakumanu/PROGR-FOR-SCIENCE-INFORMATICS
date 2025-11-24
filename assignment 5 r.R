
# LOAD REQUIRED PACKAGES
packages <- c("tidyverse", "readxl", "pheatmap")
installed <- rownames(installed.packages())
if(any(!packages %in% installed)) install.packages(packages)

library(tidyverse)
library(readxl)
library(pheatmap)

# 1A — LOAD ALL DATASETS
gene_expr <- read_excel("C:/Users/vijay/Downloads/Gene_Expression_Data.xlsx")
gene_info <- read.csv("C:/Users/vijay/Downloads/Gene_Information.csv", stringsAsFactors = FALSE)
sample_info <- read_tsv("C:/Users/vijay/Downloads/Sample_Information.tsv")

# Check sample_info column names
names(sample_info) <- c("Sample", "Phenotype")

# 1B — RENAME SAMPLE COLUMNS BASED ON PHENOTYPE
probe_col <- names(gene_expr)[1]

new_colnames <- names(gene_expr)[-1] %>%
  map_chr(~ {
    phenotype <- sample_info$Phenotype[sample_info$Sample == .x]
    if(length(phenotype) == 1) paste0(tolower(phenotype), "_", .x) else .x
  })

names(gene_expr) <- c(probe_col, new_colnames)

# 1C — SPLIT INTO TUMOR AND NORMAL TABLES
tumor_df <- gene_expr %>% select(all_of(probe_col), contains("tumor"))
normal_df <- gene_expr %>% select(all_of(probe_col), contains("normal"))

# 1D — CALCULATE AVERAGE EXPRESSION PER GENE
tumor_avg <- tumor_df %>%
  mutate(mean_tumor = rowMeans(across(-all_of(probe_col)))) %>%
  select(all_of(probe_col), mean_tumor)

normal_avg <- normal_df %>%
  mutate(mean_normal = rowMeans(across(-all_of(probe_col)))) %>%
  select(all_of(probe_col), mean_normal)

merged_avg <- left_join(tumor_avg, normal_avg, by = probe_col)

# 1E — COMPUTE LOG2 FOLD CHANGE
# log2((tumor + 1)/(normal + 1)) to avoid division by zero
merged_avg <- merged_avg %>%
  mutate(log2FC = log2((mean_tumor + 1)/(mean_normal + 1)))

# 1F — FILTER GENES WITH |LOG2FC| > 1 & ADD GENE INFO
deg <- merged_avg %>%
  filter(!is.na(log2FC), abs(log2FC) > 1) %>%
  left_join(gene_info, by = probe_col)

# 1G — ADD COLUMN INDICATING HIGHER EXPRESSION GROUP
deg <- deg %>%
  mutate(Higher_Expression = ifelse(log2FC > 0, "Tumor", "Normal"))

# 2A — BASIC EDA SUMMARY

summary(deg)
table(deg$Chromosome)
table(deg$Higher_Expression)

# 2B — HISTOGRAM: NUMBER OF DEGs PER CHROMOSOME
ggplot(deg, aes(x = Chromosome)) +
  geom_bar(fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(title = "Distribution of DEGs by Chromosome",
       x = "Chromosome",
       y = "Number of DEGs")

# 2C — HISTOGRAM OF DEGs BY SAMPLE TYPE (TUMOR/NORMAL)

ggplot(deg, aes(x = Chromosome, fill = Higher_Expression)) +
  geom_bar(position = "dodge", color = "black") +
  theme_minimal() +
  labs(title = "DEGs by Chromosome & Expression Group",
       x = "Chromosome",
       y = "Number of DEGs")

# 2D — BAR PLOT: PERCENT UP VS DOWN REGULATED

deg %>%
  count(Higher_Expression) %>%
  mutate(percent = n / sum(n) * 100) %>%
  ggplot(aes(x = Higher_Expression, y = percent, fill = Higher_Expression)) +
  geom_col(color = "black") +
  theme_minimal() +
  labs(title = "Percent of Up/Down Regulated DEGs in Tumor",
       x = "Expression Group",
       y = "Percentage")

# 2E — HEATMAP OF RAW GENE EXPRESSION
expr_matrix <- gene_expr %>%
  column_to_rownames(probe_col) %>%
  as.matrix()

pheatmap(expr_matrix,
         scale = "row",
         main = "Heatmap of Gene Expression by Sample")

# 2F — CLUSTERMAP (WITH HIERARCHICAL CLUSTERING
pheatmap(expr_matrix,
         scale = "row",
         clustering_distance_rows = "euclidean",
         clustering_distance_cols = "euclidean",
         clustering_method = "complete",
         main = "Clustermap of Gene Expression")
#2g) explanation
The analysis revealed that there are clear transcriptional differences between tumor and normal samples. The histogram of DEGs by chromosome shows that certain chromosomes, such as 1, 5, and 10, have the highest number of differentially expressed genes. When segregated by sample type, the distribution highlights that some chromosomes have more genes upregulated in tumors, while others have more genes higher in normal tissue. The bar chart shows that slightly more DEGs are downregulated in tumors compared to upregulated. The heatmap and clustermap confirm distinct clustering of tumor and normal samples, indicating that the identified genes robustly differentiate the two groups and highlight patterns of coordinated gene expression.

