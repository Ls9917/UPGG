my $megahit = "~/software/megahit";
my $indir = "~/micro_outpath";
my $ncpu = 20; 
my $out_dir = "~/01.megahit";

system "$megahit -1 $indir/metagenome.micro.1.fastq -2 $indir/metagenome.micro.2.fastq --min-count 2 --num-cpu-threads $ncpu --min-contig-len 500 -o $out_dir/sample.megahit 1>>$log 2>&1";