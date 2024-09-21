gutsmash = ~/software/gutsmash/run_gutsmash.py
MAG = ~/genome/MAG.fa
python3 $gutmash --genefinding-tool prodigal --cb-knownclusters --enable-genefunctions --cpus 10 $MAG --output-dir sample_out_dir