my $prodigal = "~/software/prodigal";
my $in_dir = "~/0_megahit";
my $out_dir = "~/04_prodigal";

system "$prodigal -a $out_dir/sample_protein.faa -d $out_dir/sample_nucl.fna -o $out_dir\sample_gff -p meta -i $in_dir/sample/final.contigs.fa 1>>$out_dir\/$dir.log 2>&1"