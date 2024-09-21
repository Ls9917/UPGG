my $inpath = "~/04_prodigal";
my $outpath = "~/05_cdhit/cds_gene90";
mkdir $outpath unless -e $outpath;

open LST, "~/05_cdhit/geneID_ANI90.list";

my %ind;
while(<LST>){
  chomp;
  my @array = split /\./, $_;
  my $reads = pop @array;
  my $name = join "\.", @array;
  push @{$ind{$name}}, $reads;
}

close LST;

my @id = keys(%ind);
system "cat $outpath/* > $outpath/all.gene90.fna";
system "rm $outpath/*cds*";
system "salmon index -t $outpath/all.gene90.fna -i $outpath/all_gene90 -k 31 -p 80";


sub run{
  my %hash;

  my $fna = "$inpath/$ind.megahit_nucl.fna";
  my $out = "$outpath/$ind.cds.gene90.fna";

  unless(-e $out){
    foreach(@{$ind{$ind}}){
      $hash{$_} = 1;
    }

    open FNA, "$fna" or say $fna;
    open OUT, ">$out" or die $!;

    my $flag = 0;
    while(<FNA>){
      chomp;
      if(/^>(.*?) \#/){
        $flag = 0;
        if(exists $hash{$1}){
          #say $1;
          $flag = 1;
          print OUT ">$ind\.$1\n";
          next;
        }
      }
      if($flag){
        print OUT "$_\n";
      }
    }

    close FNA;
    close OUT;
  }

}