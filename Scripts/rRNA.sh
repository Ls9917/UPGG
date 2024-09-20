
for i in ~/lius/microbiome/11.dRep/dRep99_all/dereplicated_genomes/*
do
name=${i##*/}
MAG=${name%.*}
~/lius/software/barrnap/bin/barrnap  --kingdom bac --threads 10 $i > $MAG.gff3
done


plat="MAG"
plat="illumina"

touch barrbap_${plat}_length.txt
echo -e "id\tstart\tend\ttype" >> barrbap_${plat}_length.txt

for i in `ls *.gff3`;
do
    base=${i%.gff3}
    cat $i | sed 's/=/\t/g' | sed 's/;/\t/g' | grep -v '^#' | awk -F"\t" -v tmp=$base '{printf("%s\t%s\t%s\t%s\n", tmp, $4, $5, $10)}' >> barrbap_${plat}_length.txt
    echo -e "\033[32m$i done...\033[0m"
done

cat barrbap_MAG_length.txt | awk '{if($4=="5S_rRNA" || $4=="type") print $0}' > barrbap_MAG_length_5S.txt

##########tRNA
for i in ~/lius/microbiome/11.dRep/dRep99_all/dereplicated_genomes/*
do
    output_dir=~/lius/Catalog/TRNA
    name=${i##*/}
    MAG=${name%.*}
    if [ -f "$output_dir/$MAG.txt" ]; then
        echo "$MAG.txt exit,skip"
    else
	prokka --outdir $output_dir --force --prefix $MAG $i 
    fi
done