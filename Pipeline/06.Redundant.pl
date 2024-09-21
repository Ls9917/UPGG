my $dRep = "~/software/dRep";
my $outpath = "~/03.drep";
my $ncpu = 6;

system "$dRep dereplicate $outpath -p $ncpu -d -comp 50 -con 5 -nc 0.25 -pa 0.9 -sa 0.99 --multiround_primary_clustering --greedy_secondary_clustering";