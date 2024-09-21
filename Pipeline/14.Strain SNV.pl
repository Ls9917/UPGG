my $indir = "~/03.drep";
my $outdir = "~/09.snv/strain_01";
my $refdir = "~/08.pangenome/strain_01";

system "snippy --outdir $outdir --ref $refdir/pan_genome_reference.fa --ctgs $indir/strain_genome.fa";