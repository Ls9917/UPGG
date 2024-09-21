my $metawrap = "~/software/metawrap";
my $num_threads = 6;
my $ncpu = 8;
my $micro_path = "~/micro_outpath";
my $in_dir = "~/2_bin_refinement";
my $out_dir = "~/3_bin_reassembly";

my $log = "$out_dir/$id.log";
system "metawrap reassemble_bins -o $out_dir -t $ncpu -1 $micro_path/sample.micro_1.fastq -2 $micro_path/sample.micro_2.fastq -m $memory -x 10 -b $in_dir/metawrap_50_10_bins 1>>$log 2>&1";