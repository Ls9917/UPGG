my $folder = "~/07.pangenome/strain_01";
my $eggnog_db = "~/database/eggnog";
my $outdir = "~/08.pangenome/strain_01/eggnog";
system "cd $folder";
system "roary -e --mafft -p 8 *.gff"
system "emapper.py -i $input --override --data_dir $eggnog_db --dmnd_db $eggnog_db/eggnog_proteins.dmnd -o $outdir --cpu 30 --matrix BLOSUM62 --seed_ortholog_evalue 1e-5 --dbtype seqdb -m diamond --itype genome";