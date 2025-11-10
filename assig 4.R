# DNA Sequence Analysis: Assignment 4

# File path for the DNA sequence
sequence_file <- "C:/Users/vijay/Downloads/chr1_GL383518v1_alt (1).fa"

# Step 1: Check if file exists and read sequence
if(!file.exists(sequence_file)){
  stop("File not found! Check the file path.")
} else {
  cat("File found successfully.\n\n")
}

# Read the FASTA file and concatenate all sequence lines
lines <- readLines(sequence_file, warn = FALSE)
sequence <- paste(lines[!grepl("^>", lines)], collapse = "")

# Convert sequence to uppercase for consistent counting
sequence <- toupper(sequence)

seq_length <- nchar(sequence)
cat("Sequence length:", seq_length, "bases\n\n")

if(seq_length < 758){
  stop("Sequence is shorter than 758 bases!")
}

# Part 1: Print specific letters
cat("Part 1: Specific letters\n")
cat("10th letter of the sequence:", substr(sequence, 10, 10), "\n")
cat("758th letter of the sequence:", substr(sequence, 758, 758), "\n\n")

# Part 2: Reverse complement
complement <- function(base){
  switch(base,
         "A"="T",
         "T"="A",
         "C"="G",
         "G"="C",
         base)  # Keep N or other ambiguous bases unchanged
}

seq_letters <- strsplit(sequence, "")[[1]]
rev_seq <- rev(seq_letters)
rev_comp <- sapply(rev_seq, complement)
rev_comp_sequence <- paste(rev_comp, collapse = "")

cat("Part 2: Reverse complement\n")
cat("79th letter of reverse complement:", substr(rev_comp_sequence, 79, 79), "\n")
cat("500th to 800th letters of reverse complement:\n")
cat(substr(rev_comp_sequence, 500, 800), "\n\n")

# Part 3: Count nucleotides per kilobase
kb_size <- 1000
num_kb <- ceiling(seq_length / kb_size)
kb_counts <- vector("list", num_kb)

for(i in 1:num_kb){
  start <- (i-1)*kb_size + 1
  end <- min(i*kb_size, seq_length)
  chunk <- substr(sequence, start, end)
  kb_counts[[i]] <- table(strsplit(chunk, "")[[1]])
}

cat("Part 3: Nucleotide counts for first kilobase\n")
print(kb_counts[[1]])
cat("\n")

# Part 4: Data frames and row sums
nucleotides <- c("A", "C", "G", "T")

# Data frame for first kilobase
first_kb_df <- as.data.frame(as.list(kb_counts[[1]]))
for(nt in nucleotides){
  if(!(nt %in% colnames(first_kb_df))){
    first_kb_df[[nt]] <- 0
  }
}
first_kb_df <- first_kb_df[, nucleotides, drop=FALSE]

cat("Part 4a: Data frame for first kilobase\n")
print(first_kb_df)
cat("\n")

# Data frame for all kilobases
all_kb_df <- do.call(rbind, lapply(kb_counts, function(x){
  df <- as.data.frame(as.list(x))
  for(nt in nucleotides){
    if(!(nt %in% colnames(df))){
      df[[nt]] <- 0
    }
  }
  df <- df[, nucleotides, drop=FALSE]
  return(df)
}))

# Sum of each row
row_sums <- rowSums(all_kb_df)
cat("Sum of nucleotides per kilobase\n")
print(row_sums)
cat("\n")

# Explanations

# Expected sum for each kilobase:
# Each kilobase normally has 1000 bases, so we expect A+C+G+T = 1000.

# Cases where the sum is not 1000:
# The last kilobase may have fewer bases if the sequence length isn't a multiple of 1000.
# Ambiguous bases like 'N' are ignored, which can reduce the total.

# Why differences occur:
# Most kilobases sum to 1000 as expected.
# The last kilobase can be shorter, so its sum is less.
# Ambiguous nucleotides are excluded from the count, further lowering the sum.
