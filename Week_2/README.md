# Assignment 1 | Introduction to Unix

**Programmer:** Tejaswini Kakumanu  
**Language Used:** Unix Shell Script  
**Date:** 14th September 2025

---

## Project Overview

This project includes a Unix shell script designed to automate the process of downloading all secondary assemblies for human chromosome 1 from the UCSC Genome Browser. The script performs the following tasks:
- Downloads all relevant chromosome 1 assembly files.
- Extracts the downloaded `.gz` files.
- Organizes the extracted files into a dedicated directory.
- Generates a summary report containing essential information about each file.

---

## Prerequisites

- **wget**: Command-line utility for downloading files from the web (Tested with version 1.21.5).
- **gunzip**: Tool to decompress `.gz` files.

---

## How to Run the Script

1. Download and save the script as `UnixASG.sh`.
2. Open your terminal.
3. Navigate to the folder containing `UnixASG.sh` using the `cd` command.
4. Make the script executable (if required):
   ```
   chmod +x UnixASG.sh
   ```
5. Run the script:
   ```
   ./UnixASG.sh
   ```

---

## Output

- **Informatics_573/**: Directory containing all downloaded and unzipped chromosome 1 assembly files.
- **data_summary.txt**: A summary file containing, for each downloaded file:
  - The filename
  - The first 10 lines of its contents
  - The total number of lines in the file

---

## Notes

- Ensure you have an active internet connection for file downloads.
- Sufficient disk space is required to store and extract the genome assemblies.
- The script is intended for educational use in the "Programming for Science Informatics" course (Week 2 assignment).
