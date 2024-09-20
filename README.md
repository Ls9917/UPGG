# UPGG
This directory contains scripts related to the manuscript "The unified pig gastrointestinal genome indicates the co-evolution of the host and microbiome under environmental pressure".
Before running, you must ensure that all required software and databases are installed successfully.
## INSTALLATION
### Tools used in the pipeline
| Tool/Database | Version       |   Purpose     |
| ------------- | ------------- | ------------- |
|    fastp      | v0.23.2       |Quality control metagenomic sequencing data  |
| bowtie2  | v2.3.5.1 |Metagenomic sequence alignment  |
|snap  |v2.0.1  |Isolation of host genomic data  |
|MEGAHIT  |v1.1.3  |Assemble and splice contigs  |
|Prodigal  |v2.6.0 |Predicted protein sequence  |
|CD-HIT  |v4.8.1 |De-redundancy of gene sequences  |
|CheckM  |v1.0.12  |Determining genome quality  |
|dRep  |v3.2.2  |Genome clustering  |
|Mash  |v2.3|Sketch for the catalogue; placement of genomes into clusters |
|GTDB-Tk  |v2.1.1 |Assigning taxonomy; generating alignments  |
|GTDB  |r227  |Database for GTDB-Tk  |
|Prokka  |v1.14.6  |Protein annotation |
