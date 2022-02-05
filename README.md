# vcf-fixer
A simple VCF fixer

## How it works

- The script requires a `data.vcf` file alongside its execution
- It reads fonetical names (FN) emails (EMAIL) and phone (PHONE) information from the file
- It will normalize phone information and remove duplicated phone and emails records from a single contact
- It generates a new vcf file, preserving the old one