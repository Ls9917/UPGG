itol=~/lius/software/table2itol/table2itol.R
cd ~/lius/catalog/03_drep_tax/itol
Rscript $itol -a -D test1 -i user_genome -l MAGID -b phylum -w 5 -t %s tax.annoation.xlsx