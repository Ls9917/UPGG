my $metawrap = "~/software/metawrap";
my $num_threads = 6;
my $ncpu = 10;
my $in_dir = "~/0_megahit";
my $out_dir = "~/1_binning";
my $micro_path = "~/micro_outpath";

system "metawrap binning -o $out_dir/sample_binning -t $ncpu -a 0_megahit/sample/final.contigs.fa --metabat2 --maxbin2 --universal $micro_path/sample.micro_1.fastq $micro_path/sample.micro_2.fastq 1>>$log 2>&1";