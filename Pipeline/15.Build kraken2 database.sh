##make node.dmp and names.dmp
perl ~/software/taxdump_edit/taxdump_edit.pl -names names.dmp -nodes nodes.dmp -taxa *MAG.fa -parent 1 -rank species -division 0
##Struo 2 https://github.com/leylabmpi/Struo2
cd indir
snakemake --use-conda -j 1 -Fqn MAG.information.txt 

##UPGG Kraken2 database
http://alphaindex.zju.edu.cn/MAGDB/kraken/UPGG.tar.gz