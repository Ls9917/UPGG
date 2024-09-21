my $index = "~/05_cdhit/final.protein.faa.90";
my $outpath = "~/06.gene_abundance";
system "salmon quant -i $index -l IU -1 metagenome_1.fastq.gz -2 metagenome_2.fastq.gz -o $outpath -p $cpu";