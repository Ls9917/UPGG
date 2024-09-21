#env gene function
my $indir = "~/05_cdhit";
my $kegg_outdir = "~/05_cdhit/kegg";
my $eggnog_outdir="~/05_cdhit/eggnog";
my $cazy_outdir = "~/05_cdhit/cazyme";
my $card_outdir = "~/05_cdhit/card";
my $vf_outdir = "~/05_cdhit/vfdb";
my $mge_outdir = "~/05_cdhit/MGE";

my $kegg_dbdir = "~/database/kofam_scan/db";
my $eggnog_dbdir = "~/database/eggnog";
my $cazy_dbdir = "~/database/cazyme";
my $vf_dbdir = "~/database/VFDB";
my $mge_dbdir = "~/databaset/MGE";


my $tmp = "$outdir/tmp";

system "exec_annotation -f detail-tsv --cpu 100 -E 1e-3 -k $kegg_dbdir/ko_list --tmp-dir $tmp -p $dbdir/profiles -o $kegg_outdir/protein90.txt $indir/final.protein.faa.90";
system "emapper.py -i $indir/final.protein.faa.90 --override --data_dir $eggnog_dbdir/ --temp_dir $tmp --dmnd_db $eggnog_dbdir/eggnog_proteins.dmnd -o $eggnog_outdir/protein90.eggout --cpu 30 --matrix BLOSUM62 --seed_ortholog_evalue 1e-5 --dbtype seqdb -m diamond";
system "hmmscan -o $cazy_outdir/protein90.dbcan --tblout $cazy_outdir/protein90.dbcan.tab -E 1e-5 --cpu 30 $cazy_dbdir/dbCAN-HMMdb-V11.txt $indir/final.protein.faa.90";
system "rgi main -i $indir/final.protein.faa.90 -o $card_outdir/protein90.card -t protein -a DIAMOND --n 20 --clean"
system "diamond blastp --query $indir/final.protein.faa.90 --db $vf_dbdir/VFDB_setB.dmnd --out $vf_outdir/protein90.vfdb.tab --evalue 1e-5 --outfmt 6 -p 50";
system "diamond blastp -q  $indir/final.protein.faa.90 -d $mge_dbdir/MGE.dmnd -p 8 -e 1e-5 -k 1 --id 80 --query-cover 80 --sensitive -o $mge_outdir/All_gene_MGE.besthit.dmnd.txt"