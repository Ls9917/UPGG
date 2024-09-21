my $cpu = 10;
my $outpath = "~/kraken_drep99";
mkdir $outpath unless -e $outpath;
my $krakenDB="~/database/krakenDB"; 
my $kraken2 = "~/software/kraken2";
my $bracken = "~/software/bracken";
my $read_merger = "~/scripts/read_merger.pl";
my $num_threads = 8;

system "$kraken2 --memory-mapping --db $krakenDB --paired $micro_path/sample.micro_1.fastq $micro_path/sample.micro_1.fastq --threads $cpu --use-names --report-zero-counts --gzip-compressed --report $outpath/sample_report --output $outpath/sample_output --report-minimizer-data --minimum-hit-groups 3";