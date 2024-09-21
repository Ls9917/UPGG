my $inpath = "~/04_prodigal";
my $outpath = "~/05_cdhit";
my $cdhit = "~/software/cd-hit";

system "cat $inpath/filter.*.faa > $outpath/all_complete_protein.faa";
system "$cdhit -i $outpath/all_complete_protein.faa -o $outpath/total.protein.faa.90 -c 0.9 -n 5 -M 0 -T 80";
system "$cdhit -i $outpath/all_complete_protein.faa -o $outpath/total.protein.faa.100 -c 1.00 -n 5 -M 0 -T 80";
cat 05_cdhit/total.protein.faa.90|grep "^>"|awk -F ' ' '{print $1}'|awk -F '>' '{print $2}' > 05_cdhit/geneID_ANI90.list