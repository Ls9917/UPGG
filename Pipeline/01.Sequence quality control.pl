######Date 2024.8.20#######

my $cpu = 20;
my $inpath = "~/inpath/metagenome";
my $outpath = "~/micro_outpath";
my $refpath = "~/refpath";
my $ref = "$refpath/susScr11";
my $snap = "~/software/snap-aligner";
my $fastp = "~/software/fastp";
my $qcpath = "~/00_QC";
my $bowtie2 ="~/software/bowtie2";

    my $raw_fq1 = "$inpath/metagenome_1.fastq.gz";
    my $raw_fq2 = "$inpath/metagenome_2.fastq.gz";

    my $json_rpt = "$qcpath/metagenome.json";
    my $html_rpt = "$qcpath/metagenome.html";

    my $cln_fq1 = "$qcpath/metagenome.cln.R1.fq.gz";
    my $cln_fq2 = "$qcpath/metagenome.cln.R2.fq.gz";

    
      system "$fastp -i $raw_fq1 -I $raw_fq2 -o $cln_fq1 -O $cln_fq2 -z 2 -w $cpu -j $json_rpt -h $html_rpt";
      
      system "$bowtie2 --no-mixed --no-discordant --sensitive --threads $cpu -x $ref -1 $cln_fq1 -2 $cln_fq2 --un-conc-gz $outpath/$metagenome.bowtie.unal.%.fastq.gz --no-unal > $outpath/$sample.bowtie_aln.sam";

      system "$snap paired $refpath $outpath/metagenome.bowtie.unal.1.fastq.gz $outpath/$metagenome.bowtie.unal.2.fastq.gz -o $outpath/$metagenome.snap_aln.sam -F a -t $cpu";

      my %reads;
      open SAM, "$outpath/$metagenome.bowtie_aln.sam";

      while(<SAM>){
        chomp;
        unless(/^@/){
          my @array = split;
          $reads{$array[0]} = 1;
        }
      }

      close SAM;

      open SAM, "$outpath/$metagenome.snap_aln.sam";
      while(<SAM>){
        chomp;
        unless(/^@/){
          my @array = split;
          $reads{$array[0]} = 1;
        }
      }

      close SAM;

      open LST, ">$outpath/$metagenome.aln.list";

      for my $k(keys %reads){
        say LST $k;
      }

      close LST;

      #micro reads and host reads

      subseq2("$outpath/metagenome.aln.list", $cln_fq1, "$outpath/metagenome.micro.1.fastq", "$outpath/$sample.host.1.fastq", $cpu);
      subseq2("$outpath/metagenome.aln.list", $cln_fq2, "$outpath/metagenome.micro.2.fastq", "$outpath/$sample.host.2.fastq", $cpu);


sub subseq2{
  my $alnlist = shift;
  my $fq = shift;
  my $micro = shift;
  my $host = shift;
  my $cpu = shift;

  if(-s "$alnlist"){
    system "software/seqkit grep -f $alnlist $fq -o $host.gz -j $cpu";
    system "software/seqkit grep -f $alnlist $fq -v -o $micro.gz -j $cpu";
  }else{
    system "cp $fq $micro.gz";
    system "touch $host.gz";
  }

}