##192  conda activate gutMASH
dereplicated_genomes=/disk202/lius/microbiome/11.dRep/dRep99_all/dereplicated_genomes
for i in $dereplicated_genomes/*.fa
do
    name=${i##*/}
    sample=${name%%.fa}
    gutmash=/disk192/lius/software/gutsmash/run_gutsmash.py
    out=/disk202/lius/catalog/05_cdhit/gutmash
    sample_out_dir=${out}/${sample}

    if [ ! -d "$sample_out_dir" ]; then
        mkdir -p $sample_out_dir
        python3 $gutmash --genefinding-tool prodigal --cb-knownclusters --enable-genefunctions --cpus 10 ${i} --output-dir $sample_out_dir
    else
        echo "Directory $sample_out_dir already exists, skipping..."
    fi
done