my $metawrap = "~/software/metawrap";
my $num_threads = 6;
my $ncpu = 10;
my $in_dir = "~/1_binning";
my $out_dir = "~/2_bin_refinement";

system "metawrap bin_refinement -o $out_dir -t $ncpu -A $in_dir/sample/metabat2_bins/ -B $in_dir/sample/maxbin2_bins/ -c 50 -x 10 --quick 1>>$log 2>&1";